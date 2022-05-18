module fourbit_counter(Enable,clk,rst, Q);

output reg[3:0] Q;
input Enable,clk,rst;


always @(posedge clk or posedge rst) begin
	if (rst)
		Q = 4'b0000;
	else if (Enable == 1'b1)
		Q <= (Q + 1);
		
	else
		Q <= Q;
end

endmodule