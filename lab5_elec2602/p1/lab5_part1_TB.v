`timescale 1ns / 1ps
 
module lab5_part1_TB;

reg [15:0] count;
reg Enable,clk,clr;
wire[15:0] Q;


bs_counter inst_counter(.Enable(Enable), .clk(clk), .clr(clr), .Q(Q));


initial begin 
		count = 16'b0000000000000000;
		clk = 1'b0;
	end
	
	always begin
		#50
		count=count+16'b0000000000000001;
	end
	

	always begin
		#50
		clk = 1'b1;
		#50
		clk = 1'b0;
	end	

	
	always @(count) begin
		case (count)
		16'b0000000000000000 : begin Enable = 1'b1; clr = 1'b1; end
		16'b0000000000000001 : begin Enable = 1'b1; clr = 1'b0; end
		16'b0000000000000100 : begin Enable = 1'b0; clr = 1'b0; end
		16'b0000000000000101 : begin Enable = 1'b1; clr = 1'b0; end
		16'b0000000000000111 : begin Enable = 1'b0; clr = 1'b1; end

		//default : ... end 
	endcase
	end

 
endmodule