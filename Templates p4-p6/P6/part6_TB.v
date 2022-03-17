`timescale 1ns / 1ps
 
module part6_TB;
 
	// ------------------ Instantiate module ------------------
	// We are instantiating the module mux2, naming it instantiate_mux2.
	// select, input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg [3:0] count;
	reg [1:0] S,U,V,W,X;
	
	wire [6:0] output_7seg1, output_7seg2, output_7seg3, output_7seg4;
	part6 instantiate_p6 (.s(S),.u(U),.v(V),.w(W),.x(X),
							.code1(output_7seg1),
							.code2(output_7seg2),
							.code3(output_7seg3),
							.code4(output_7seg4)
							);
 	
	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin S = 2'b00; U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11; end
		// Add other relevant test cases and complete default case
		default : begin ... end
	endcase
	end

 
endmodule
