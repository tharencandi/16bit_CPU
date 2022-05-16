module register_block(clk, rst, r1_in, r2_in,r3_in, r4_in, r5_in, r6_in, r7_in, r8_in, r1_out, r2_out,r3_out, r4_out, r5_out, r6_out, r7_out, r8_out );
	
	input clk, rst;
	input [15:0] r1_in, r2_in,r3_in, r4_in, r5_in, r6_in, r7_in, r8_in;
	output [15:0] r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out;
	
	sixteen_bit_reg r1(.D(r1_in), .clk(clk), .rst(rst), .Q(r1_out));
	sixteen_bit_reg r1(.D(r2_in), .clk(clk), .rst(rst), .Q(r2_out));
	sixteen_bit_reg r1(.D(r3_in), .clk(clk), .rst(rst), .Q(r3_out));
	sixteen_bit_reg r1(.D(r4_in), .clk(clk), .rst(rst), .Q(r4_out));
	sixteen_bit_reg r1(.D(r5_in), .clk(clk), .rst(rst), .Q(r5_out));
	sixteen_bit_reg r1(.D(r6_in), .clk(clk), .rst(rst), .Q(r6_out));
	sixteen_bit_reg r1(.D(r7_in), .clk(clk), .rst(rst), .Q(r7_out));
	sixteen_bit_reg r1(.D(r8_in), .clk(clk), .rst(rst), .Q(r8_out));
	
endmodule