`timescale 1ns / 1ps
module datapath_TB;
	
	reg [7:0] count;
	reg clk, rst; 
	reg [2:0] sw;
	wire [6:0] seg0, seg1,seg2,seg3;
	
	datapath dp(.clk(clk), .rst(rst), .sw(sw), .seg0(seg0), .seg1(seg1), .seg2(seg2), .seg3(seg3));
	
	initial begin 
		count = 8'b0;
		clk = 1'b0;
	end
	
	always begin
		
		#50
		clk = ~clk;
		count=count+8'b00000001;

	end
  
  always@ (count) begin
  case(count) 
  8'b0: begin rst = 1'b1; sw = 3'b0; end   // resetting
  8'b1: begin rst = 1'b1; sw = 3'b0; end 
  default: begin rst = 1'b0; sw = 3'b0;  end  // should hold previous value 
  endcase
  end
  
 endmodule