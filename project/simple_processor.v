module simple_processor(SW, HEX0, HEX1, HEX2, HEX3, KEY, CLOCK_50);
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	input [9:0] SW;
	input [3:0] KEY;
	input CLOCK_50;
	
	datapath dp(.clk(KEY[0]), .rst(~KEY[1]), .sw(SW[3:0]), .seg0(HEX0), .seg1(HEX1), .seg2(HEX2), .seg3(HEX3));
endmodule