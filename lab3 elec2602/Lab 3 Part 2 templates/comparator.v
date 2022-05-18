module comparator (v, z);
	input [3:0] v; 	
	output reg z; 
	
	always @(v)
	begin
	  if (v > 9)
		z = 1'b1;
	  else
		z = 1'b0;
	end
endmodule


