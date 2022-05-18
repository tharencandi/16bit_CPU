`timescale 1ns / 1ps

module program_counter_tb;
  
	reg [4:0] count;
	reg clk, rst, select, pc_enable;
	reg [15:0] pc_in, bus;
	
	wire [15:0] out;
  
  program_counter(.clk(clk), .rst(rst), .p_in(p_in), .bus(bus), .select(select), .pc_enable(pc_enable), .out(out));
  
	initial begin 
		count = 5'b0;
		clk = 1'b1;
	end
	
	always begin
		
		#25
		clk = 1'b0;

		#25
		clk = 1'b1;
		count=count+4'b0001;
	end
  
  always@ (count) begin
  case(count) begin 
  4'b0000: begin rst = 1'b1; end // resetting
  4'b0010: begin rst = 1'b0; p_in = 1'b1; bus 16'b0; select = 1'b0; pc_enable = 1'b1; end // out should equal p_in + 1 
  4'b0100: begin rst = 1'b0; p_in = 1'b1; bus 16'b0; select = 1'b0; pc_enable = 1'b0; end // should hold previous value
  4'b0110: begin rst = 1'b0; p_in = 1'b1; bus 16'b1; select = 1'b1; pc_enable = 1'b1; end // out should equal bus (1)
  default: begin rst = 1'b0; p_in = 1'b0; select = 1'b0; pc_enable = 1'b0; end  // should hold previous value 
  end
  
 endmodule


  
  
  
  
  
 
