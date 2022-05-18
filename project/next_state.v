module next_state(instr, new_instr, state, next_state);
	
	input new_instr;
	input [15:0] instr;
	input [3:0] state;
	output reg [15:0] next_state;
	
	
	wire[8:0] temp;
	assign temp = {new_instr, instr[15:12], state};
	
	always @(temp) begin
		casez (temp)
		9'b0zzzz0000: begin next_state = 4'b0000; end	//stay in s0
		9'b1zzzz0000: begin next_state = 4'b0001; end // new instruction, go to s1
		9'bz00000001: begin next_state = 4'b0010; end //start load
		9'bz00010001: begin next_state = 4'b0011; end // start move
		9'bz00100001: begin next_state = 4'b1001; end // start add (add0)
		9'bz00110001: begin next_state = 4'b0110; end //start sub (sub0)
		9'bz01000001: begin next_state = 4'b1100; end // start xor
		9'bz01010001: begin next_state = 4'b0100; end // start ldpc
		9'bz01100001: begin next_state = 4'b0101; end // start branch
		
		// ones that just go back to s01 (load,mov,add2,sub2,xor2, ldpc, branch)
		9'bzzzzz0010: begin next_state = 4'b0000; end //load
		9'bzzzzz0011: begin next_state = 4'b0000; end //mov
		9'bzzzzz1011: begin next_state = 4'b0000; end //add2
		9'bzzzzz1000: begin next_state = 4'b0000; end //sub2
 		9'bzzzzz1110: begin next_state = 4'b0000; end //xor2
		9'bzzzzz0100: begin next_state = 4'b0000; end //ldpc
		9'bzzzzz0101: begin next_state = 4'b0000; end //branch
		
		// add 0 - add 1 - add 2
		9'bzzzzz1001: begin next_state = 4'b1010; end
		9'bzzzzz1010: begin next_state = 4'b1011; end
		
		// sub 0 - sub 1 - sub 2
		9'bzzzzz0110: begin next_state = 4'b0111; end
		9'bzzzzz0111: begin next_state = 4'b1000; end
		// xor 0 - xor 1 - xor 2
		9'bzzzzz1100: begin next_state = 4'b1101; end
		9'bzzzzz1101: begin next_state = 4'b1110; end
		
		default : begin next_state = 4'b0000; end
		endcase
		end
endmodule