module control_output(state, instr, rin, rout, gin, gout, pcin, pcout, addsub, xorctrl)
	input [3:0] state;
	input [15:0] instr;
	output reg[7:0] rin, rout;
	output reg gin, gout, pcin, pcout, addsub, addsub, xorctrl;
	
	//rx = 12,11,10
	//ry = 9,8,7
	//d = 10 - 2
	
	always @(state) begin
		case(state)
		4'b0000: begin end
		4'b0010: begin begin rin = 8'b00000000, rout= = 8'b00000000; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; xorctrl = 1'b0;  end
		
		
		default : begin out = 1'b0; end
	endcase
	end
	
endmodule