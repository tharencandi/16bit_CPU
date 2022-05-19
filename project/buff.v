module buff (a,b,enable);
	input [15:0] a;
	input enable;
	output reg [15:0] b;
	always @ (enable or a) begin
	
		if (enable) 
			b = a;
		else 
			b = 16'bz;
	
	end
endmodule