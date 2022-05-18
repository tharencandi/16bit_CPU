module lab3_p4_inst(SW,LEDR,HEX0,HEX1);

	input[9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0;
	output [6:0] HEX1;


	
	//instantiate and connect fourBit_FA
	/*
		A is the first 4 switches
		B is the next 4
		The entire sum is leds 0-4 (because cout is the fifth bit)
	*/
	lab3_p4 inst(.a(SW[3:0]),.b(SW[7:4]),.cin(SW[9]), .display1(HEX1), .display2(HEX0), .warning(LEDR[9]));
	
	
endmodule