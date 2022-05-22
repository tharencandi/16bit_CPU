module eight_bit_reg(D,clk,rst,Q);

input[7:0] D;
input clk, rst;
output reg [7:0] Q;

always @(posedge clk or posedge rst) begin

	if (rst == 1'b1)
		Q <= 8'b0;
	else 
		Q <= D;
	end
	
endmodule