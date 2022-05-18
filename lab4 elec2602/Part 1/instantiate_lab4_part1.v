module instantiate_lab4_part1(SW,LEDR);
 
	input[9:0] SW ;
	output [9:0] LEDR;
	gated_RS instantiate_gated_RS (
	.clk(SW[2]), 
	.R(SW[0]), 
	.S(SW[1]), 
	.Q(LEDR[0]), 
	.Qnot(LEDR[1]));
	
endmodule