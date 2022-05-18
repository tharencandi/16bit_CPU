module next_state(instr, state, next_state);
	
	input [15:0] instr;
	input [3:0] state;
	output reg [15:0] next_state;
	
	
	wire[7:0] temp;
	assign temp = {instr[15:12], state};
	
	always @(temp) begin
		casez (temp)
		8'bzzzz0000: begin next_state = 4'b0001; end // new instruction, go to s1
		8'b00000001: begin next_state = 4'b0010; end //start load
		8'b00010001: begin next_state = 4'b0011; end // start move
		8'b00100001: begin next_state = 4'b1001; end // start add (add0)
		8'b00110001: begin next_state = 4'b0110; end //start sub (sub0)
		8'b01000001: begin next_state = 4'b1100; end // start xor
		8'b01010001: begin next_state = 4'b0100; end // start ldpc
		8'b01100001: begin next_state = 4'b0101; end // start branch
		
		// ones that just go back to s01 (load,mov,add2,sub2,xor2, ldpc, branch)
		8'bzzzz0010: begin next_state = 4'b0000; end //load
		8'bzzzz0011: begin next_state = 4'b0000; end //mov
		8'bzzzz1011: begin next_state = 4'b0000; end //add2
		8'bzzzz1000: begin next_state = 4'b0000; end //sub2
 		8'bzzzz1110: begin next_state = 4'b0000; end //xor2
		8'bzzzz0100: begin next_state = 4'b0000; end //ldpc
		8'bzzzz0101: begin next_state = 4'b0000; end //branch
		
		// add 0 - add 1 - add 2
		8'bzzzz1001: begin next_state = 4'b1010; end
		8'bzzzz1010: begin next_state = 4'b1011; end
		
		// sub 0 - sub 1 - sub 2
		8'bzzzz0110: begin next_state = 4'b0111; end
		8'bzzzz0111: begin next_state = 4'b1000; end
		// xor 0 - xor 1 - xor 2
		8'bzzzz1100: begin next_state = 4'b1101; end
		8'bzzzz1101: begin next_state = 4'b1110; end
		
		default : begin next_state = 4'b0000; end
		endcase
		end
endmodule