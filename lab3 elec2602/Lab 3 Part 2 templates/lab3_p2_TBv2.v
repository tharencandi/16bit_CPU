`timescale 1ns / 1ps
 
module lab3_p2_TBv2;
 
	// ------------------ Instantiate module ------------------
	// We are instantiating the module mux2, naming it instantiate_mux2.
	// select, input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg [3:0] count;
	reg [3:0] input_binary;
	wire [6:0] output_7seg1, output_7seg2;
	
	lab3_p2_v1 instantiate_lab3_p2_v1(.v(input_binary), .d1(output_7seg1), .d2(output_7seg2));
 	
	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin input_binary = 4'b1111; end
		4'b0001 : begin input_binary = 4'b1110; end
		4'b0010 : begin input_binary = 4'b1101; end
		4'b0011 : begin input_binary = 4'b1100; end
		4'b0100 : begin input_binary = 4'b1011; end
		4'b0101 : begin input_binary = 4'b1010; end
		4'b0110 : begin input_binary = 4'b1001; end
		4'b0111 : begin input_binary = 4'b1000; end
		4'b1000 : begin input_binary = 4'b0111; end
		4'b1001 : begin input_binary = 4'b0110; end
		4'b1010 : begin input_binary = 4'b0101; end
		4'b1011 : begin input_binary = 4'b0100; end
		4'b1100 : begin input_binary = 4'b0011; end
		4'b1101 : begin input_binary = 4'b0010; end
		4'b1110 : begin input_binary = 4'b0001; end
		4'b1111 : begin input_binary = 4'b0000; end
		default : begin input_binary = 4'b0000; end
	endcase
	end

 
endmodule