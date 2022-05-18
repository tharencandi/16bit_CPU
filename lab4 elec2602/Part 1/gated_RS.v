module gated_RS (clk, R, S, Q, Qnot);
   input  R, S, clk;
   output Q, Qnot;
	
   wire   R_g, S_g, Qa, Qb /* synthesis keep */;
	
   assign R_g = ~(clk & R);
	assign S_g = ~(clk & S);
	assign Qa = ~(Qb & S_g);
	assign Qb = ~(Qa & R_g);
	
	assign Q = Qa;
	assign Qnot = Qb;
	
endmodule