module stack_pointer(in, out, sel, enable, clk, rst);
	input enable, clk, rst;
	input [1:0] sel;
	input [15:0] in;
	output reg [15:0] out;
	
	reg [15:0] temp;
	
	always @(sel or out or in) begin
		
		if (sel == 2'b00)
			temp = in;
		else if (sel == 2'b01)
			temp = out + 1'b1;
		else 
			temp = out - 1'b1;
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1)
			out = 16'b1111111111111111;
		else if (enable == 1'b1)
			out = temp;
	end
endmodule