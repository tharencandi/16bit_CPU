module next_state(instr, state, next_state);
	
	input [15:0] instr;
	input [7:0] state;
	output reg [7:0] next_state;
	
	
	wire[11:0] temp;
	assign temp = {instr[15:12], state};
	
	always @(temp) begin
		casez (temp)
		12'bzzzz00000000: begin next_state = 8'b1111; end // new instruction, go to s1
		12'bzzzz00001111: begin next_state = 8'b0001; end // load new instr
		12'b000000000001: begin next_state = 8'b0010; end //exec
		12'b000100000001: begin next_state = 8'b0011; end // start move
		12'b001000000001: begin next_state = 8'b1001; end // start add (add0)
		12'b001100000001: begin next_state = 8'b0110; end //start sub (sub0)
		12'b010000000001: begin next_state = 8'b1100; end // start xor
		12'b010100000001: begin next_state = 8'b0100; end // start ldpc
		12'b011000000001: begin next_state = 8'b0101; end // start branch
		12'b100000000001: begin next_state = 8'b10011; end // start push
		12'b100100000001: begin next_state = 8'b10111; end //start pop
		12'b101000000001: begin next_state = 8'b11011; end // start CALL
		12'b101100000001: begin next_state = 8'b100001; end // start ret
		
		// ones that just go back to s01 (load,mov,add2,sub2,xor2, ldpc, branch)
		12'bzzzz00000010: begin next_state = 8'b0000; end //load
		12'bzzzz00000011: begin next_state = 8'b0000; end //mov
		12'bzzzz00001011: begin next_state = 8'b0000; end //add2
		12'bzzzz00001000: begin next_state = 8'b0000; end //sub2
 		12'bzzzz00001110: begin next_state = 8'b0000; end //xor2
		12'bzzzz00000100: begin next_state = 8'b0000; end //ldpc
		12'bzzzz00000101: begin next_state = 8'b0000; end //branch
		
		// add 0 - add 1 - add 2
		12'bzzzz00001001: begin next_state = 8'b1010; end
		12'bzzzz00001010: begin next_state = 8'b1011; end
	
		// sub 0 - sub 1 - sub 2
		12'bzzzz00000110: begin next_state = 8'b0111; end
		12'bzzzz00000111: begin next_state = 8'b1000; end
		// xor 0 - xor 1 - xor 2
		12'bzzzz00001100: begin next_state = 8'b1101; end
		12'bzzzz00001101: begin next_state = 8'b1110; end
		
		// pushes
		12'bzzzz00010011: begin next_state = 8'b10100; end 
		12'bzzzz00010100: begin next_state = 8'b10101; end
		12'bzzzz00010101: begin next_state = 8'b10110; end
		
		// pops
		12'bzzzz00010111: begin next_state = 8'b00011000; end
		12'bzzzz00011000: begin next_state = 8'b00011001; end
		12'bzzzz00011001: begin next_state = 8'b00011010; end
		
		//calls
		12'bzzzz00011011: begin next_state = 8'b00011100; end
		12'bzzzz00011100: begin next_state = 8'b00011101; end
		12'bzzzz00011101: begin next_state = 8'b00011110; end
		12'bzzzz00011110: begin next_state = 8'b00011111; end
		12'bzzzz00011111: begin next_state = 8'b00100000; end
		
		//rets
		12'bzzzz00100001: begin next_state = 8'b00100010; end
		12'bzzzz00100010: begin next_state = 8'b00100011; end
		12'bzzzz00100011: begin next_state = 8'b00100100; end
	
		
		default : begin next_state = 8'b0; end
		endcase
		end
endmodule