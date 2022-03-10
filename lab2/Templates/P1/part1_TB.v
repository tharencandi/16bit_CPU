`timescale 1ns / 1ps
 
module part1_TB;
 
	// ------------------ Instantiate module ------------------
	// We are instantiating the module mux2, naming it instantiate_mux2.
	// select, input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg [3:0] count; //create a 4 bit register
	reg select; //create a 1 bit select register
	reg [3:0] input1, input2; //create two 4 bit inputs 
	wire [3:0] output1; //4 bit output
	
	four_bit_2to1muxV2 instantiate_mux4(.sel(select),.a(input1),.b(input2),.chosen(output1));
 	
	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin input1 = 4'b0000; input2 = 4'b0001; select = 1'b0; end
		4'b0001 : begin input1 = 4'b0010; input2 = 4'b0011; select = 1'b1; end
		4'b0010 : begin input1 = 4'b0100; input2 = 4'b0111; select = 1'b0; end 
		4'b0011 : begin input1 = 4'b1000; input2 = 4'b1111; select = 1'b1; end
		default : begin input1 = 4'b0000; input2 = 4'b0000; select = 1'b0; end
	endcase
	end

 
endmodule
