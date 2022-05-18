module sixteenb_counterV2(Enable,clk,clr,Q);

output reg[15:0] Q;
input Enable,clk,clr;


always @(posedge clk or posedge clr) begin
	if (clr)
		Q = 16'b0000000000000000;
	else if (Enable == 1'b1)
		Q <= (Q + 1);
		
	else
		Q <= Q;
end

endmodule