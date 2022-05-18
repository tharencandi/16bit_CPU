module control_output(state, instr, rin, rout, gin, gout, pcin, pcout, addsub, a_in, xorctrl, ctrl_out);
	input [3:0] state;
	input [15:0] instr;
	output [7:0] rin, rout;
	output reg gin, gout, pcin, pcout, addsub, a_in, xorctrl, ctrl_out;

	reg rx_in,rx_out, ry_in, ry_out;
	wire [7:0] rx_in_data, rx_out_data, ry_in_data, ry_out_data;
	

	assign rin = rx_in_data | ry_in_data;
	assign rout = rx_out_data | ry_out_data;
	
	
	// d is put on bus when control_unit_out = 1
	
	
	// 7 instructions
	//8 rx possibilities
	// 8 ry possibilites
	
	//rx = 12,11,10
	//ry = 9,8,7
	//d = 10 - 2
	

	
	always @(state) begin
		case(state)
		
		//load (rx_in and ctrl_out)
		4'b0010: begin ctrl_out = 1'b1; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
		
		//move (rx_in and ry_out)
		4'b0011: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
		
		//ldpc (pc_out and rx_in)
		4'b0100: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b1; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
		
		//branch (pc_in, rx_out)
		4'b0101: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b1; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
		
		
		//SUB
		
		//sub 0 (rx_out, a_in)
		4'b0110: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; end
		
		//sub 1 (ry_out, addsub, g_in)
		4'b0111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b1; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b1; a_in = 1'b0; xorctrl = 1'b0; end
		
		//sub 2 (g_out, rx_in)
		4'b1000: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b1; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
		
		//ADD
		
		//add 0 (rx_out, a_in)
		4'b1001: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; end
		
		//add 1 (ry_out, g_in)
		4'b1010: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b1; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
		
		//add 2 (g_out, rx_in)
		4'b1011: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b1; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end 
		
		
		//XOR
		//add 0 (rx_out, a_in)
		4'b1100: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; end
		
		//add 1 (ry_out, g_in, xor_ctrl)
		4'b1101: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b1; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b1; end
		
		//add 2 (g_out, rx_in)
		4'b1110: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b1; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end 
		
		
		
		default  : begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; end
	endcase
	end
	wire [3:0] rx, ry;
	assign rx = instr[11:8];
	assign ry = instr[7:4];
	binary_to_reg_sig get_rx_in(.bin(rx), .enable(rx_in), .r_sig(rx_in_data));
	binary_to_reg_sig get_rx_out(.bin(rx), .enable(rx_out), .r_sig(rx_out_data));
	binary_to_reg_sig get_ry_in(.bin(ry), .enable(ry_in), .r_sig(ry_in_data));
	binary_to_reg_sig get_ry_out(.bin(ry), .enable(ry_out), .r_sig(ry_out_data));
	
	
	
endmodule