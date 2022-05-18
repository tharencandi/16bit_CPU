`timescale 1ns / 1ps
 
module lab5_part1_TB;

reg [3:0] count;
reg T,clk,clr;
wire Q;


Toggle_FF inst_Toggle(T, clk, clr, Q);


initial begin 
		count = 4'b0000;
		clk = 1'b0;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	

	always begin
		#50
		clk = 1'b1;
		#50
		clk = 1'b0;
	end	

	
	always @(count) begin
		case (count)
		4'b0000 : begin T = 1'b1; clr = 1'b1; end
		4'b0010 : begin T = 1'b0; clr = 1'b0; end
		4'b0100 : begin T = 1'b1; clr = 1'b0; end

		//default : ... end 
	endcase
	end

 
endmodule