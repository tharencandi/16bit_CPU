module Toggle_FF(T, clk, clr, Q);

input clk,T,clr;
output reg Q;

always @(posedge clk or posedge clr) begin
	if (clr)
		Q = 1'b0;
	else if (T == 1'b1)
		Q <= ~Q;
		
	else
		Q <= Q;

end
endmodule