module next_state(w, state, next_state);

input w;
input [3:0] state;
wire [4:0] temp;
output reg [3:0] next_state;

assign temp = {state, w};

always @(temp) begin 
	case (temp)
	
	5'b00000 : begin next_state = 4'b0001; end
	5'b00001 : begin next_state = 4'b0101; end
	5'b00010 : begin next_state = 4'b0010; end
	5'b00011 : begin next_state = 4'b0101; end
	5'b00100 : begin next_state = 4'b0011; end
	5'b00101 : begin next_state = 4'b0101; end
	5'b00110 : begin next_state = 4'b0100; end
	5'b00111 : begin next_state = 4'b0101; end
	5'b01000 : begin next_state = 4'b0100; end
	5'b01001 : begin next_state = 4'b0101; end
	5'b01010 : begin next_state = 4'b0001; end
	5'b01011 : begin next_state = 4'b0110; end
	5'b01100 : begin next_state = 4'b0001; end
	5'b01101 : begin next_state = 4'b0111; end
	5'b01110 : begin next_state = 4'b0001; end
	5'b01111 : begin next_state = 4'b1000; end
	5'b10000 : begin next_state = 4'b0001; end
	5'b10001 : begin next_state = 4'b1000; end
	default : begin next_state = 4'b0000; end
	
	endcase
	end
		
		
endmodule