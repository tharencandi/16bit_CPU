module sixteenb_counter(Enable, clk, clr, Q);

input Enable;
input clk,clr;
output[15:0] Q;
wire [15:0] t;

/*Toggle_FF inst_Toggle0( .T(Enable), .clk(clk), .clr(clr), .Q(Q[0]));
assign t[0] = Enable & Q[0];
Toggle_FF inst_Toggle1( .T(t[0]), .clk(clk), .clr(clr), .Q(Q[1]));
assign t[1] = t[0] & Q[1]
Toggle_FF inst_Toggle2( .T(Q[0] & Q[1]), .clk(clk), .clr(clr), .Q(Q[2]));
	
end
*/

assign t[0] = Enable;

Toggle_FF inst_Toggle0( .T(Enable), .clk(clk), .clr(clr), .Q(Q[0]));


generate
genvar i;
	for(i=1; i<=15; i=i+1) begin : fucku
		assign t[i] = t[i-1] & Q[i-1];
		Toggle_FF Toggle_FF_inst (.T(t[i]), .clk(clk), .clr(clr), .Q(Q[i]));
	end
endgenerate 

endmodule
