module master_slave (clk, D, Q, Qnot);
   input  D, clk;
   output Q, Qnot;
   
   wire Qm, Qs;
	
   // You will need to instantiate a few instances of gated_Dlatch, 
   // and perhaps assign some intermediate signals
	
	gated_DLatch D_inst_TOP(.clk(~clk), .D(D), .Q(Qm), .Qnot());
	gated_DLatch D_inst_BOT(.clk(clk), .D(Qm), .Q(Qs), .Qnot(Qnot));
	
	assign Q = Qs;
	
	
endmodule