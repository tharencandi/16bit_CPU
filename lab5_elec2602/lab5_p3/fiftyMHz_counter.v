 module fiftyMHz_counter(clk,Q,clr);

output reg[25:0] Q;
input clk,clr;


always @(posedge clk or posedge clr) begin
		
	if (clr)
		Q <= 26'b00000000000000000000000000;
		
	else
		Q <= Q + 1'b1;
end

endmodule