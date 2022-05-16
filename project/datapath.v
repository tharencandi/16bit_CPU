module datapath(clk, rst);

	
	wire[15:0] bus, ctrl_output, r1_in,r2_in,r3_in, r4_in, r5_in, r6_in, r7_in, r8_in, r1_out, r2_out,r3_out, r4_out, r5_out, r6_out, r7_out, r8_out;
	wire [15:0] ra_in, acc_out;
	
	register_block registers(.clk(clk), .rst(rst), .r1_in(r1_in), .r2_in(r2_in),.r3_in(r3_in), .r4_in(r4_in), .r5_in(r5_in), .r6_in(r6_in), 
		.r7_in(r7_in), .r8_in(r8_in), .r1_out(r1_out), .r2_out(r2_out),.r3_out(r3_out), .r4_out(r4_out), .r5_out(r5_out), .r6_out(r6_out), .r7_out(r7_out), .r8_out(r8_out));
	
	sixteen_bit_reg instruction_register();
	
	sixten_bit_reg program_counter();
	
	ram_block ram(.addr(),.out(),.in());
	
	control_unit control_unit_inst();
	
	alu alu_inst(.clk(clk), .rst(rst), .a(), .b(bus), .addsub(), .xor_ctrl(), .out(acc_out));
	buff a_reg_in_buff(.a(bus),.b(ra_in),.enable());
	buff accumulator_buff(.a(acc_out),.b(bus),.enable());
	
	
	// tri state buffers
	buff ctrl_unit_out_buff(.a(ctrl_output),.b(bus),.enable());
	
	buff pc_in_buff(.a(bus),.b(),.enable());
	buff pc_out_buff(.a(),.b(bus),.enable());
	
	buff ram_in_buf(.a(),.b(),.enable());
	buff ram_out_buff(.a(),.b(),.enable());
	
	buff instr_in_buff(.a(),.b(),.enable());


	
	

	
	buff r1_in_b(.a(bus),.b(r1_in),.enable(rin[0]));
	buff r2_in_b(.a(bus),.b(r2_in),.enable(rin[1]));
	buff r3_in_b(.a(bus),.b(r3_in),.enable(rin[2]));
	buff r4_in_b(.a(bus),.b(r4_in),.enable(rin[3]));
	buff r5_in_b(.a(bus),.b(r5_in),.enable(rin[4]));
	buff r6_in_b(.a(bus),.b(r6_in),.enable(rin[5]));
	buff r7_in_b(.a(bus),.b(r7_in),.enable(rin[6]));
	buff r8_in_b(.a(bus),.b(r8_in),.enable(rin[7]));
	
	buff r1_out_b(.a(r1_out),.b(bus),.enable(rout[0]));
	buff r2_out_b(.a(r2_out),.b(bus),.enable(rout[1]));
	buff r3_out_b(.a(r3_out),.b(bus),.enable(rout[2]));
	buff r4_out_b(.a(r4_out),.b(bus),.enable(rout[3]));
	buff r5_out_b(.a(r5_out),.b(bus),.enable(rout[4]));
	buff r6_out_b(.a(r6_out),.b(bus),.enable(rout[5]));
	buff r7_out_b(.a(r6_out),.b(bus),.enable(rout[6]));
	buff r8_out_b(.a(r8_out),.b(bus),.enable(rout[7]));
	
endmodule