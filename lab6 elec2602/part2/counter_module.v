module counter_module(n, rst, clk, enable, c, save);

input enable, rst, clk,save;
input[3:0] n;
output reg c;
wire[3:0] current_count; 

fourbit_counter counter(.Enable(enable),.clk(clk),.rst(rst), .Q(current_count));

always @(current_count or n) begin
if (current_count == n)
	c <= 1'b1;
else
	c <= 1'b0;
end 
endmodule