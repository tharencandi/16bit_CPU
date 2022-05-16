module second_count_50clk(out, clk, rst);

input clk,rst;
output[15:0] out;
wire[25:0] t1;
reg comp_out; 

sixteenb_counterV2(.Enable(comp_out),.clk(clk),.clr(rst),.Q(out));

fiftyMHz_counter(.clk(clk),.Q(t1),.clr(comp_out | rst));

always @(posedge clk) begin
	if (t1 == 26'b10111110101111000010000000)
		comp_out = 1'b1;
		
	else 
		comp_out = 1'b0;
		
end
	
endmodule