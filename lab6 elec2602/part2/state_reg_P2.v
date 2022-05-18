module threebit_state_reg_P2(D,clk,rst,Q);

input[2:0] D;
input clk, rst;
output reg [2:0] Q;

always @(posedge clk or posedge rst) begin

	if (rst == 1'b1)
		Q <= 3'b000;
	else 
		Q <= D;
	end
	
endmodule