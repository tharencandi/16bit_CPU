`timescale 1ns / 1ps
module lab3_p4_TB;

	reg [3:0] count;
	reg [3:0] a, b;
	reg cin;
	wire [6:0] display2, display1;
	wire warning;
		
	lab3_p4 p4_instantiate (.a(a),.b(b),.cin(cin),.display1(display2),.display2(display1), .warning(warning));
	
	//Add inputs/outputs
	
	//instantiate and connect fourBit_FA
 	
	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin a = 4'b0111; b = 4'b0111; cin= 1'b0; end
		4'b0001 : begin a = 4'b0111; b = 4'b0101; cin= 1'b0; end
		4'b0010 : begin a = 4'b1010; b = 4'b1010; cin= 1'b0; end
		4'b0011 : begin a = 4'b0001; b = 4'b0001; cin= 1'b0; end
		4'b0100 : begin a = 4'b0111; b = 4'b0111; cin= 1'b1; end
		default : begin a = 4'b0000; b = 4'b0000; cin= 1'b0; end
	endcase
	end
	
endmodule