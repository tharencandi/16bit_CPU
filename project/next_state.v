module next_state(instr, state, next_state, status_reg);
	
	input [15:0] instr;
	input [7:0] state;
	output reg [7:0] next_state;
	input[3:0] status_reg;
	
	
	wire[14:0] temp;
	assign temp = {status_reg[3:1], instr[15:12], state};
	
	always @(temp) begin
		casez (temp)
		15'bzzzzzzz00000000: begin next_state = 8'b1111; end // new instruction, go to s1
		15'bzzzzzzz00001111: begin next_state = 8'b0001; end // load new instr
		15'bzzz000000000001: begin next_state = 8'b0010; end //exec
		15'bzzz000100000001: begin next_state = 8'b0011; end // start move
		15'bzzz001000000001: begin next_state = 8'b1001; end // start add (add0)
		15'bzzz001100000001: begin next_state = 8'b0110; end //start sub (sub0)
		15'bzzz010000000001: begin next_state = 8'b1100; end // start xor
		15'bzzz010100000001: begin next_state = 8'b0100; end // start ldpc
		15'bzzz011000000001: begin next_state = 8'b0101; end // start branch
		15'bzzz100000000001: begin next_state = 8'b10011; end // start push
		15'bzzz100100000001: begin next_state = 8'b10111; end //start pop
		15'bzzz101000000001: begin next_state = 8'b11011; end // start CALL
		15'bzzz101100000001: begin next_state = 8'b100001; end // start ret

		15'bzzz110000000001: begin next_state = 8'b00100110; end //start CPU
		15'bzzz110100000001: begin next_state = 8'b00101001; end //start BREQ
		15'bzzz111000000001: begin next_state = 8'b00101110; end //start BRLO
		15'bzzz111100000001: begin next_state = 8'b00101111; end //start BRHI
		15'bzzz011100000001: begin next_state = 8'b00101000; end //start MUL
		
		// ones that just go back to s0 (load,mov,add2,sub2,xor2, ldpc, branch) --> is this supposed to be s0??
		15'bzzzzzzz00000010: begin next_state = 8'b0000; end //load
		15'bzzzzzzz00000011: begin next_state = 8'b0000; end //mov
		15'bzzzzzzz00001011: begin next_state = 8'b0000; end //add2
		15'bzzzzzzz00001000: begin next_state = 8'b0000; end //sub2
 		15'bzzzzzzz00001110: begin next_state = 8'b0000; end //xor2
		15'bzzzzzzz00000100: begin next_state = 8'b0000; end //ldpc
		15'bzzzzzzz00000101: begin next_state = 8'b0000; end //branch

		15'bzzzzzzz00100111: begin next_state = 8'b0000; end //cpu1
		
		// add 0 - add 1 - add 2
		15'bzzzzzzz00001001: begin next_state = 8'b1010; end
		15'bzzzzzzz00001010: begin next_state = 8'b1011; end
	
		// sub 0 - sub 1 - sub 2
		15'bzzzzzzz00000110: begin next_state = 8'b0111; end
		15'bzzzzzzz00000111: begin next_state = 8'b1000; end
		// xor 0 - xor 1 - xor 2
		15'bzzzzzzz00001100: begin next_state = 8'b1101; end
		15'bzzzzzzz00001101: begin next_state = 8'b1110; end
		
		// pushes
		15'bzzzzzzz00010011: begin next_state = 8'b10100; end 
		15'bzzzzzzz00010100: begin next_state = 8'b10101; end
		15'bzzzzzzz00010101: begin next_state = 8'b10110; end
		
		// pops
		15'bzzzzzzz00010111: begin next_state = 8'b00011000; end
		15'bzzzzzzz00011000: begin next_state = 8'b00011001; end
		15'bzzzzzzz00011001: begin next_state = 8'b00011010; end
		
		//calls
		15'bzzzzzzz00011011: begin next_state = 8'b00011100; end
		15'bzzzzzzz00011100: begin next_state = 8'b00011101; end
		15'bzzzzzzz00011101: begin next_state = 8'b00011110; end
		15'bzzzzzzz00011110: begin next_state = 8'b00011111; end
		15'bzzzzzzz00011111: begin next_state = 8'b00100000; end
		15'bzzzzzzz00100000: begin next_state = 8'b1001010; end
		
		//rets
		15'bzzzzzzz00100001: begin next_state = 8'b00100010; end
		15'bzzzzzzz00100010: begin next_state = 8'b00100011; end
		15'bzzzzzzz00100011: begin next_state = 8'b00100100; end

		//CPU 0 - CPU 1
		15'bzzzzzzz00100110: begin next_state = 8'b00100111; end
		

		//breq1 -> breq2 if Z=1 -> breq4 -> breq3
		15'bzz1zzzz00101001: begin next_state = 8'b00101010; end 
		15'bzzzzzzz00101010: begin next_state = 8'b00101100; end
		15'bzzzzzzz00101100: begin next_state = 8'b00101101; end
		//breq1 -> breq3 if z=0
		15'bzz0zzzz00101001: begin next_state = 8'b00101011; end


		//brlo1 -> brlo2 if N=1 -> brlo4 -> brlo3
		15'b1zzzzzz00101110: begin next_state = 8'b00101010; end 
		//brlo1 -> brlo3 if N=0
		15'b0zzzzzz00101110: begin next_state = 8'b00101011; end

		//brhi1 -> brhi2 if P=1 -> brhi4 -> brhi3
		15'bz1zzzzz00101111: begin next_state = 8'b00101010; end 
		//brhi1 -> brhi3 if P=0
		15'bz0zzzzz00101111: begin next_state = 8'b00101011; end
		
		//mul0 -> mul1 
		15'bzzzzzzz00101000 : begin next_state = 8'b10000; end
		//mul1 -> mul2
		15'bzzzzzzz00010000 : begin next_state = 8'b10001; end
		//mul2 -> mul3
		15'bzzzzzzz00010001 : begin next_state = 8'b10010; end

		
		default : begin next_state = 8'b0; end
		endcase
		end
endmodule