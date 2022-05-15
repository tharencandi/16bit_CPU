module binary_to_reg_sig(bin, enable, r_sig);
	input[2:0] bin;
	input enable;
	output reg[7:0] r_sig;
	
	wire [3:0] temp;
	assign temp = {enable,bin};
	
	always @(temp) begin
	case (temp)
	4'b1001 : begin r_sig = 8'b00000001; end
	4'b1001 : begin r_sig = 8'b00000010; end
	4'b1010 : begin r_sig = 8'b00000100; end
	4'b1011 : begin r_sig = 8'b00001000; end
	4'b1100 : begin r_sig = 8'b00010000; end
	4'b1101 : begin r_sig = 8'b00100000; end
	4'b1110 : begin r_sig = 8'b01000000; end
	4'b1111 : begin r_sig = 8'b10000000; end
	default : begin r_sig = 8'b00000000; end
	
	endcase
	end
endmodule