`timescale 1ns / 1ps
module lab3_p3_TB;

	reg [3:0] count;
	reg [3:0] a, b;
	reg cin;
	wire [3:0] s;
	wire cout;
		
	fourBit_FA fa_instantiate (.a(a),.b(b),.cin(cin),.cout(cout),.s(s));
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
		4'b0000 : begin a = 4'b1000; b = 4'b0011; cin= 1'b0; end
		4'b0001 : begin a = 4'b1010; b = 4'b1010; cin= 1'b0; end
		default : begin a = 4'b0000; b = 4'b0000; cin= 1'b0; end
	endcase
	end
	
endmodule