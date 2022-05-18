`timescale 1ns / 1ps
 
module lab4_part5_TB;

reg [3:0] count;
reg [3:0] num1,num2;
reg clk, rst;
wire [6:0] a2_h, a1_h, b2_h, b1_h;


fourHexDisplay inst_fourHexdispl(num1, num2, clk, rst, a2_h, a1_h, b2_h, b1_h);


initial begin 
		count = 4'b0000;
		clk = 1'b0;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
///*
	always begin
		#100
		clk = 1'b1;
		#100
		clk = 1'b0;
	end	
//*/
	
	always @(count) begin
		case (count)
		4'b0000 : begin num1 = 4'b0011; num2 = 4'b1010; rst = 1'b0; end // b1_h = 3 b2_h = A
		4'b0010 : begin num1 = 4'b0101; num2 = 4'b1011; rst = 1'b0; end // a1_h = 3 a2_h = A, b1_h = 5 b2_h = B
		
		4'b0100 : begin num1 = 4'b0011; num2 = 4'b1010; rst = 1'b1; end // a1_h = 0 a2_h = 0, b1_h = 3 b2_h = A
/*		4'b0101 : begin Din = 1'b1; end
		4'b0110 : begin Din = 1'b1; end
		4'b0111 : begin Din = 1'b1; end
		4'b1000 : begin Din = 1'b1; end
		4'b1001 : begin Din = 1'b0; end
		4'b1010 : begin Din = 1'b0; end
		4'b1011 : begin Din = 1'b0; end
		4'b1100 : begin Din = 1'b1; end
		4'b1101 : begin Din = 1'b0; end
		4'b1110 : begin Din = 1'b0; end
		4'b1111 : begin Din = 1'b0; end	*/
		//default : begin num1 = 4'b0011; num2 = 4b'1010; rst = 1b'0; end 
	endcase
	end

 
endmodule