module next_state_P2(w, state, next_state, c);

input w, c;
input [2:0] state;
wire [4:0] temp;
output reg [2:0] next_state;

assign temp = {state, w, c};

always @(temp) begin 
	casez (temp)
	// s0 = start state
	// s1 = counting zeros
	//s2 = n zeros counted
	//s3 = counting ones
	//s4 = n ones counted
		
	5'b0000z : begin next_state = 3'b001; end //s0, w=0,c=x -> s1
	5'b0001z : begin next_state = 3'b101; end //s0, w=1,c=x -> s3

	5'b00100 : begin next_state = 3'b001; end //s1, w=0,c=0 -> s1
	5'b00110 : begin next_state = 3'b101; end //s1, w=1,c=0 -> s3
	5'b001z1 : begin next_state = 3'b010; end //s1, w=x,c=1 -> s2

	5'b0100z : begin next_state = 3'b010; end //s2, w=0,c=x -> s2
	5'b0101z : begin next_state = 3'b011; end //s2, w=1,c=x -> s3

	5'b01100 : begin next_state = 3'b001; end //s3, w=0,c=0 -> s1
	5'b01110 : begin next_state = 3'b011; end //s3, w=1,c=0 -> s3
	5'b011z1 : begin next_state = 3'b100; end //s3, w=x,c=1 -> s4

	5'b1001z : begin next_state = 3'b100; end //s4, w=1,c=x -> s4
	5'b1000z : begin next_state = 3'b001; end //s4, w=0,c=x -> s1
	default :begin next_state = 3'b000; end
	endcase
end

endmodule
