module part6 (s,u,v,w,x,code1,code2,code3,code4);
 
	input[1:0] s;
	input[1:0] u, v, w, x;
	output[6:0] code1, code2, code3,code4;
		
	// You need 4 instances of part 5 connected to inputs appropriately.
	part5 inst1();
	part5 inst2();
	//...

endmodule 