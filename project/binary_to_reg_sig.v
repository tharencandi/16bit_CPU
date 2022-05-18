module binary_to_reg_sig(bin, enable, r_sig);
	input[3:0] bin;
	input enable;
	output reg[7:0] r_sig;
	
	wire [4:0] temp;
	assign temp = {enable,bin};
	
	always @(temp) begin
	case (temp)
	5'b10001 : begin r_sig = 8'b00000001; end
	5'b10001 : begin r_sig = 8'b00000010; end
	5'b10010 : begin r_sig = 8'b00000100; end
	5'b10011 : begin r_sig = 8'b00001000; end
	5'b10100 : begin r_sig = 8'b00010000; end
	5'b10101 : begin r_sig = 8'b00100000; end
	5'b10110 : begin r_sig = 8'b01000000; end
	5'b10111 : begin r_sig = 8'b10000000; end
	default : begin r_sig = 8'b00000000; end
	
	endcase
	end
endmodule