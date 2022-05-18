module fourHexDisplay(num1, num2, clk, rst, a2_h, a1_h, b2_h, b1_h);

	input[3:0] num1, num2;
	input clk, rst;
	output[6:0] a2_h, a1_h, b2_h, b1_h;
	
	wire[3:0] a1,a2, b1,b2;

/*assign b1 = num1;
assign b2 = num2;
*/

fourbit_reg fourb_reg1_inst(.D(num1), .clk(clk), .rst(rst), .Q(a1));
fourbit_reg fourb_reg2_inst(.D(num2), .clk(clk), .rst(rst), .Q(a2));

binary_to_7Seg binary_to_7SegA1_inst(.binary(a1), .sevenSeg(a1_h));
binary_to_7Seg binary_to_7SegA2_inst(.binary(a2), .sevenSeg(a2_h));
binary_to_7Seg binary_to_7SegB1_inst(.binary(num1), .sevenSeg(b1_h));
binary_to_7Seg binary_to_7SegB2_inst(.binary(num2), .sevenSeg(b2_h));

endmodule