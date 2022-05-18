module gated_DLatch (clk, D, Q, Qnot);
   input  D, clk;
   output Q, Qnot;
	
   // You will need to instantiate gated_RS and modify relevant signals
	
	gated_RS gated_inst(.clk(clk), .R(~D), .S(D), .Q(Q), .Qnot(Qnot));

endmodule