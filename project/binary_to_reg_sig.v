module binary_to_reg_sig(bin, enable, r_sig);
	input[3:0] bin;
	input enable;
	output reg[15:0] r_sig;
	
	wire [4:0] temp;
	assign temp = {enable,bin};
	
	always @(temp) begin
	case (temp)
	5'b10000 : begin r_sig = 16'b0000000000000001; end
	5'b10001 : begin r_sig = 16'b0000000000000010; end
	5'b10010 : begin r_sig = 16'b0000000000000100; end
	5'b10011 : begin r_sig = 16'b0000000000001000; end
	5'b10100 : begin r_sig = 16'b0000000000010000; end
	5'b10101 : begin r_sig = 16'b0000000000100000; end
	5'b10110 : begin r_sig = 16'b0000000001000000; end
	5'b10111 : begin r_sig = 16'b0000000010000000; end
	5'b11000 : begin r_sig = 16'b0000000100000000; end
	5'b11001 : begin r_sig = 16'b0000001000000000; end
	5'b11010 : begin r_sig = 16'b0000010000000000; end
	5'b11011 : begin r_sig = 16'b0000100000000000; end
	5'b11100 : begin r_sig = 16'b0001000000000000; end
	5'b11101 : begin r_sig = 16'b0010000000000000; end
	5'b11110 : begin r_sig = 16'b0100000000000000; end
	5'b11111 : begin r_sig = 16'b1000000000000000; end
	default : begin r_sig = 16'b0000000000000000; end
	
	endcase
	end
endmodule