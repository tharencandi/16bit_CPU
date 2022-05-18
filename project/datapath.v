module datapath(clk, rst);
	
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
	
	wire [7:0] rin, rout;
	wire wren, stack_ctrl, ram_out_ctrl, instr_ctrl, acc_enable, acc_out_ctrl, pc_enable, pc_out_ctrl, addsub, a_enable, xor_ctrl, cu_out_ctrl;
	wire[15:0] instr, bus, instr_address, cu_out, r1_out, r2_out,r3_out, r4_out, r5_out, r6_out, r7_out, r8_out;
	wire [15:0] ra_in, acc_out;
	reg [15:0] ram_address;
	wire [15:0] ram_out;
	
	//instruction register takes input from bus and outputs the next instruction which will be input to control unit
	sixteen_bit_reg instruction_register(.clk(clk),.rst(rst),.D(bus),.Q(instr),.enable(instr_ctrl));
	
	//program counter will increment when enabled, or take input from bus based on select signal
	
	program_counter pc(.clk(clk),.rst(rst), .select(pcin), .bus(bus), .out(instr_address),.pc_enable(pc_enable));
	buff pc_out_buff(.a(instr_address),.b(bus),.enable(pc_out_ctrl));
	

	
	
	always@(stack_ctrl) begin
		if (stack_ctrl == 1'b1)
			ram_address <= r8_out;
		else 
			ram_address <= instr_address;
	end
		
			
	// RAM
	RAM_Port1 (.address(ram_address), .clock(clk), .data(bus), .wren(wren), .q(ram_out));
	buff ram_out_buff(.a(ram_out),.b(bus),.enable(ram_out_ctrl));
	
	
	//CU
	control_unit control_unit_inst
	(	
		.clk(clk), .rst(rst), .instr(instr), .rin(rin), 
		.rout(rout), .gin(acc_enable), .gout(acc_out_ctrl), .pcin(pc_enable), 
		.pcout(pc_out_ctrl), .addsub(addsub), .a_in(a_enable), 
		.xorctrl(xor_ctrl), .ctrl_out(cu_out_ctrl), 
		.out(cu_out), .new_instr(),.instr_ctrl(instr_ctrl)	
	);
	
	buff ctrl_unit_out_buff(.a(cu_out),.b(bus),.enable(cu_out_ctrl));
	
	
	// alu outputs accumulator register which needs to be dealt with by a tristate buffer
	alu alu_inst(
		.clk(clk), .rst(rst), .a(bus),.a_enable(a_enable), 
		.b(bus), .addsub(addsub), .xor_ctrl(xor_ctrl), .out(acc_out), .acc_enable(acc_enable)
		);
		
	buff accumulator_buff(.a(acc_out),.b(bus),.enable(acc_out_ctrl));
	
	
	/*
	genvar i;
	generate 
		for (i = 0; i < 8; i += 1) begin
		sixteen_bit_reg rk(.D(bus), .clk(clk), .rst(rst), .Q(r1_out),.enable(rin[i]));
		end
	endgenerate
	*/
	
	// reg and tri-state-buffers
	sixteen_bit_reg r1(.D(bus), .clk(clk), .rst(rst), .Q(r1_out),.enable(rin[0]));
	sixteen_bit_reg r2(.D(bus), .clk(clk), .rst(rst), .Q(r2_out),.enable(rin[1]));
	sixteen_bit_reg r3(.D(bus), .clk(clk), .rst(rst), .Q(r3_out),.enable(rin[2]));
	sixteen_bit_reg r4(.D(bus), .clk(clk), .rst(rst), .Q(r4_out),.enable(rin[3]));
	sixteen_bit_reg r5(.D(bus), .clk(clk), .rst(rst), .Q(r5_out),.enable(rin[4]));
	sixteen_bit_reg r6(.D(bus), .clk(clk), .rst(rst), .Q(r6_out),.enable(rin[5]));
	sixteen_bit_reg r7(.D(bus), .clk(clk), .rst(rst), .Q(r7_out),.enable(rin[6]));
	sixteen_bit_reg r8(.D(bus), .clk(clk), .rst(rst), .Q(r8_out),.enable(rin[7]));
	
	buff r1_out_b(.a(r1_out),.b(bus),.enable(rout[0]));
	buff r2_out_b(.a(r2_out),.b(bus),.enable(rout[1]));
	buff r3_out_b(.a(r3_out),.b(bus),.enable(rout[2]));
	buff r4_out_b(.a(r4_out),.b(bus),.enable(rout[3]));
	buff r5_out_b(.a(r5_out),.b(bus),.enable(rout[4]));
	buff r6_out_b(.a(r6_out),.b(bus),.enable(rout[5]));
	buff r7_out_b(.a(r6_out),.b(bus),.enable(rout[6]));
	buff r8_out_b(.a(r8_out),.b(bus),.enable(rout[7]));
	
endmodule