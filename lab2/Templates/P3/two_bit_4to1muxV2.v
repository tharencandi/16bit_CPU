
module two_bit_4to1muxV2 (s,u,v,w,x,m);
 
	input[1:0] s;
	input[1:0] u,v,w,x;
	output reg[1:0] m;
	
	reg[1:0] t1, t2;
	
	always @(u,v,s[0]) begin
		if (s[0] == 0)
			t1 = u;
		else
			t1 = v;
	end
	
	always @(w,x,s[0]) begin
		if (s[0] == 0)
			t2 = w;
		else
			t2 = x;
	end
	
	always @(t1,t2,s[1]) begin
		if (s[1] == 0)
			assign m = t1;
		else
			assign m = t2;
	end
	
	//complete always blocks (look at one_bit_4to1muxV2.v for hints. Should look the same)
endmodule
