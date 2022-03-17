module decoder_7seg(code, decoded_output);

	input[1:0] code;
	
	output reg[6:0]  decoded_output;
	always @(code) begin
		case (code)
		4'b0000 : begin decoded_output = 7'b0000111; end
		4'b0001 : begin decoded_output = 7'b1110000; end 
		4'b0010 : begin decoded_output = 7'b0011100; end
		4'b0011 : begin decoded_output = 7'b1100011; end	
		default : begin decoded_output = 7'b0000000; end
	endcase
	end
	

 
endmodule
