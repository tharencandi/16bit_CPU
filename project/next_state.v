module next_state(instr, state, next_state);
	
	input [15:0] instr;
	input [4:0] state;
	output reg [4:0] next_state;
	
	
	wire[8:0] temp;
	assign temp = {instr[15:12], state};
	
	always @(temp) begin
		casez (temp)
		9'bzzzz00000: begin next_state = 5'b1111; end // new instruction, go to s1
		9'bzzzz01111: begin next_state = 5'b0001; end // load new instr
		9'b000000001: begin next_state = 5'b0010; end //exec
		9'b000100001: begin next_state = 5'b0011; end // start move
		9'b001000001: begin next_state = 5'b1001; end // start add (add0)
		9'b001100001: begin next_state = 5'b0110; end //start sub (sub0)
		9'b010000001: begin next_state = 5'b1100; end // start xor
		9'b010100001: begin next_state = 5'b0100; end // start ldpc
		9'b011000001: begin next_state = 5'b0101; end // start branch
		
		// ones that just go back to s01 (load,mov,add2,sub2,xor2, ldpc, branch)
		9'bzzzz00010: begin next_state = 5'b0000; end //load
		9'bzzzz00011: begin next_state = 5'b0000; end //mov
		9'bzzzz01011: begin next_state = 5'b0000; end //add2
		9'bzzzz01000: begin next_state = 5'b0000; end //sub2
 		9'bzzzz01110: begin next_state = 5'b0000; end //xor2
		9'bzzzz00100: begin next_state = 5'b0000; end //ldpc
		9'bzzzz00101: begin next_state = 5'b0000; end //branch
		
		// add 0 - add 1 - add 2
		9'bzzzz01001: begin next_state = 5'b1010; end
		9'bzzzz01010: begin next_state = 5'b1011; end
	
		// sub 0 - sub 1 - sub 2
		9'bzzzz00110: begin next_state = 5'b0111; end
		9'bzzzz00111: begin next_state = 5'b1000; end
		// xor 0 - xor 1 - xor 2
		9'bzzzz01100: begin next_state = 5'b1101; end
		9'bzzzz01101: begin next_state = 5'b1110; end
		
		default : begin next_state = 5'b0; end
		endcase
		end
endmodule