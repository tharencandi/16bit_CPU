module comparator_7seg (a, b, z);
	input [3:0] a, b; 	
	output reg [3:0] z; 
	
	always @(a, b)
	begin
	  if ((a > 7) || (b > 7))
		z = 1'b1;
	  else
		z = 1'b0;
	end
endmodule