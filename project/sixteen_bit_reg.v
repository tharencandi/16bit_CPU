module sixteen_bit_reg(D, clk, rst, Q)

	input[15:0] D;
	input clk, rst;
	output reg [15:0] Q;

	always @(posedge clk or posedge rst) begin

		if (rst == 1'b1)
			Q <= 16'b0;
		else 
			Q <= D;
		end
		
endmodule