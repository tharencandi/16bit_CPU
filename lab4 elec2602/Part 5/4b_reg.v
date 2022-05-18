module fourbit_reg(D, clk, rst, Q);
	input[3:0] D; 
	input clk,rst;
	output reg[3:0] Q; 

always @ (posedge clk or posedge rst) begin
	if (rst == 1'b1)
		Q <= 4'b0000; 
	else
		Q <= D; 
end 
endmodule