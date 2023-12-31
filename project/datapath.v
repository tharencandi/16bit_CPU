module datapath(clk, rst, sw, seg0, seg1,seg2,seg3);
	
	/*
		This cpu has:
			- an instruction register that stores the current instruction
			- a program counter to store the next instruction address
			- RAM to store the program and data
			- 8 x 16 bit general purpose registers 
			- an ALU with:
				- an adder and subtractor
				- a XOR operation
				- an accumulator register
				- an an A reg
	*/
	
	
	input clk, rst;
	
	input [3:0] sw;
	output [6:0] seg0,seg1,seg2,seg3;
	
	wire [15:0] rin, rout;
	wire wr_enable, ram_addr_sel, pcin, ram_out_ctrl, instr_ctrl, acc_enable, acc_out_ctrl, pc_enable, pc_out_ctrl, addsub, a_enable, xor_ctrl, cu_out_ctrl, mul_out_ctrl, mul_acc_out_ctrl, sr_sel, add_ctrl;
	wire[15:0] instr, bus, instr_address, cu_out, r0_out, r1_out,r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out,r10_out, r11_out, r12_out, r13_out, mul_acc_out, sp_out;
	wire [15:0] ra_in, acc_out, sr_out;
	reg [15:0] ram_address, sr_in;
	wire [15:0] ram_out;
	wire[1:0] sp_sel;

	wire[3:0] status_reg;
	

	//instruction register takes input from bus and outputs the next instruction which will be input to control unit
	sixteen_bit_reg instruction_register(.clk(clk),.rst(rst),.D(bus),.Q(instr),.enable(instr_ctrl));
	
	//program counter will increment when enabled, or take input from bus based on select signal
	
	program_counter pc(.clk(clk),.rst(rst), .select(pcin), .bus(bus), .out(instr_address),.pc_enable(pc_enable));
	buff pc_out_buff(.a(instr_address),.b(bus),.enable(pc_out_ctrl));
	

	
	
	always@(ram_addr_sel or sp_out or instr_address) begin
		if (ram_addr_sel == 1'b1)
			ram_address <= sp_out;
		else 
			ram_address <= instr_address;
	end
		
			
	// RAM

	RAM_Port1 ram(.address(ram_address), .clock(clk), .data(bus), .wren(wr_enable), .q(ram_out));
	buff ram_out_buff(.a(ram_out),.b(bus),.enable(ram_out_ctrl));
	
	
	//CU
	control_unit control_unit_inst
	(	
		.clk(clk), .rst(rst), .instr(instr), .rin(rin), 
		.rout(rout), .gin(acc_enable), .gout(acc_out_ctrl), .pcin(pcin), 
		.pcout(pc_out_ctrl), .addsub(addsub), .a_in(a_enable), 
		.xorctrl(xor_ctrl), .ctrl_out(cu_out_ctrl), 
		.out(cu_out),.ram_addr_sel(ram_addr_sel), .ram_out_ctrl(ram_out_ctrl), 
		.instr_enable(instr_ctrl),.pc_enable(pc_enable), .wr_enable(wr_enable), .sp_sel(sp_sel), .sr_sel(sr_sel), .current_status(sr_out[3:0]),
		.mul_out_ctrl(mul_out_ctrl), .mul_acc_out_ctrl(mul_acc_out_ctrl),
		.add_ctrl(add_ctrl)	
	);
	
	buff ctrl_unit_out_buff(.a(cu_out),.b(bus),.enable(cu_out_ctrl));
	
	
	// alu outputs accumulator register which needs to be dealt with by a tristate buffer
	alu alu_inst(
		.clk(clk), .rst(rst), .a(bus),.a_enable(a_enable), 
		.b(bus), .addsub(addsub), .xor_ctrl(xor_ctrl), .acc_out(acc_out), .acc_enable(acc_enable)
		,.mul_acc_out(mul_acc_out), .mul_out_ctrl(mul_out_ctrl), .status_reg(status_reg), .add_ctrl(add_ctrl)
		);
	
	buff accumulator_buff(.a(acc_out),.b(bus),.enable(acc_out_ctrl));
	buff mul_accumulator_buff(.a(mul_acc_out),.b(bus),.enable(mul_acc_out_ctrl));
	
	/*
	
	genvar i;
	generate 
		for (i = 0; i < 8; i += 1) begin
		sixteen_bit_reg rk(.D(bus), .clk(clk), .rst(rst), .Q(r1_out),.enable(rin[i]));
		end
	endgenerate
	*/
	
	wire [27:0] displays;
	assign seg0 = displays[6:0];
	assign seg1 = displays[13:7];
	assign seg2 = displays[20:14];
	assign seg3 = displays[27:21];
	
	//display driver
	seven_seg_controller display_driver
	(
		.sw(sw), .r0(r0_out), .r1(r1_out), .r2(r2_out), 
		.r3(r3_out), .r4(r4_out), .r5(r5_out), .r6(r6_out),
		.r7(r7_out), 
		.r8(r8_out),
		.r9(r9_out),
		.r10(r10_out),
		.r11(r11_out),
		.r12(r12_out),
		.r13(r13_out),
		.r14(sr_out),
		.r15(sp_out),
		
		.displ(displays)
	);
	
	// reg and tri-state-buffers
	
	stack_pointer sp(.in(bus), .out(sp_out), .sel(sp_sel), .enable(rin[15]), .clk(clk), .rst(rst));
	buff sp_out_b(.a(sp_out),.b(bus),.enable(rout[15]));
	
	
	sixteen_bit_reg r0(.D(bus), .clk(clk), .rst(rst), .Q(r0_out),.enable(rin[0]));
	sixteen_bit_reg r1(.D(bus), .clk(clk), .rst(rst), .Q(r1_out),.enable(rin[1]));
	sixteen_bit_reg r2(.D(bus), .clk(clk), .rst(rst), .Q(r2_out),.enable(rin[2]));
	sixteen_bit_reg r3(.D(bus), .clk(clk), .rst(rst), .Q(r3_out),.enable(rin[3]));
	sixteen_bit_reg r4(.D(bus), .clk(clk), .rst(rst), .Q(r4_out),.enable(rin[4]));
	sixteen_bit_reg r5(.D(bus), .clk(clk), .rst(rst), .Q(r5_out),.enable(rin[5]));
	sixteen_bit_reg r6(.D(bus), .clk(clk), .rst(rst), .Q(r6_out),.enable(rin[6]));
	sixteen_bit_reg r7(.D(bus), .clk(clk), .rst(rst), .Q(r7_out),.enable(rin[7]));
	
	sixteen_bit_reg r8(.D(bus), .clk(clk), .rst(rst), .Q(r8_out),.enable(rin[8]));
	sixteen_bit_reg r9(.D(bus), .clk(clk), .rst(rst), .Q(r9_out),.enable(rin[9]));
	sixteen_bit_reg r10(.D(bus), .clk(clk), .rst(rst), .Q(r10_out),.enable(rin[10]));
	sixteen_bit_reg r11(.D(bus), .clk(clk), .rst(rst), .Q(r11_out),.enable(rin[11]));
	sixteen_bit_reg r12(.D(bus), .clk(clk), .rst(rst), .Q(r12_out),.enable(rin[12]));
	sixteen_bit_reg r13(.D(bus), .clk(clk), .rst(rst), .Q(r13_out),.enable(rin[13]));


	//SR
	//SR mux
	always@(status_reg or bus or sr_sel) begin
		if (sr_sel == 1'b0)
			sr_in = bus;
		else
			sr_in = status_reg;
	end
	
	//SR reg14
	sixteen_bit_reg status_register(.D(sr_in), .clk(clk), .rst(rst), .Q(sr_out),.enable(rin[14]));
	//SR buff
	buff sr_out_b(.a(sr_out),.b(bus),.enable(rout[14]));
	

	
	buff r0_out_b(.a(r0_out),.b(bus),.enable(rout[0]));
	buff r1_out_b(.a(r1_out),.b(bus),.enable(rout[1]));
	buff r2_out_b(.a(r2_out),.b(bus),.enable(rout[2]));
	buff r3_out_b(.a(r3_out),.b(bus),.enable(rout[3]));
	buff r4_out_b(.a(r4_out),.b(bus),.enable(rout[4]));
	buff r5_out_b(.a(r5_out),.b(bus),.enable(rout[5]));
	buff r6_out_b(.a(r6_out),.b(bus),.enable(rout[6]));
	buff r7_out_b(.a(r7_out),.b(bus),.enable(rout[7]));
	
	buff r8_out_b(.a(r8_out),.b(bus),.enable(rout[8]));
	buff r9_out_b(.a(r9_out),.b(bus),.enable(rout[9]));
	buff r10_out_b(.a(r10_out),.b(bus),.enable(rout[10]));
	buff r11_out_b(.a(r11_out),.b(bus),.enable(rout[11]));
	buff r12_out_b(.a(r12_out),.b(bus),.enable(rout[12]));
	buff r13_out_b(.a(r13_out),.b(bus),.enable(rout[13]));
	
endmodule