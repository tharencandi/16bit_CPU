module instantiate_lab4_part4(SW,LEDR);
 
	input[9:0] SW ;
	output [9:0] LEDR;

	// instantiate and connect all 3 flip flops
	// Use same inputs (same switches for D, clk to all instances)
	// Use 3 separate LED outputs
	
	dff_pos instantiate_dff_pos (.D(SW[0]), .clk(SW[2]), .Q(LEDR[0]), .Qnot(LEDR[1]));

	dff_neg instantiate_dff_neg (.D(SW[0]), .clk(SW[2]), .Q(LEDR[2]), .Qnot(LEDR[3]));
	
	d_latch instantiate_d_latch (.D(SW[0]), .clk(SW[2]), .Q(LEDR[4]), .Qnot(LEDR[5]));
	
endmodule