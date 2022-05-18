module instantiate_lab4_part3(SW,LEDR);
 
	input[9:0] SW ;
	output [9:0] LEDR;

	// instantiate and connect master_slave
	master_slave (.clk(SW[2]), .D(SW[0]), .Q(LEDR[0]), .Qnot(LEDR[1]));
	
endmodule