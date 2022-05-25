module control_output(state, instr, rin, rout, gin, gout, pcin, pcout, addsub, a_in, xorctrl, ctrl_out, ram_addr_sel, ram_out_ctrl, instr_enable, pc_enable,wr_enable, sp_sel, d_select, sr_sel);
	input [7:0] state;
	input [15:0] instr;
	output [15:0] rin, rout;
	output reg gin, gout, pcin, pcout, addsub, a_in, xorctrl, ctrl_out, ram_addr_sel, ram_out_ctrl, instr_enable, pc_enable, wr_enable, d_select, sr_sel;
	output reg [1:0] sp_sel;
	reg rx_in,rx_out, ry_in, ry_out;
	wire [15:0] rx_in_data, rx_out_data, ry_in_data, ry_out_data;
	
	reg [15:0] sp_enable, SR_enable;

	assign rin = rx_in_data | ry_in_data | {sp_enable << 15} | {SR_enable << 14};
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
		8'b00000: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end // state 0 PC will update // goes to state 1111
		8'b01111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b1; instr_enable = 1'b1; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end  // state 1111 the RAM output will update its output
		8'b00001: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end // state 2 put new instruction in instruction register. 
		//load (rx_in and ctrl_out)
		8'b00010: begin ctrl_out = 1'b1; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//move (rx_in and ry_out)
		8'b00011: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//ldpc (pc_out and rx_in)
		8'b00100: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b1; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00;sp_enable = 1'b0;  d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//branch (pc_in, rx_out)
		8'b00101: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b1; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		
		//SUB
		
		//sub 0 (rx_out, a_in)
		8'b00110: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//sub 1 (ry_out, addsub, g_in)
		8'b00111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b1; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b1; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//sub 2 (g_out, rx_in)
		8'b01000: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b1; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//ADD
		
		//add 0 (rx_out, a_in)
		8'b01001: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//add 1 (ry_out, g_in)
		8'b01010: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b1; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//add 2 (g_out, rx_in)
		8'b01011: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b1; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00;sp_enable = 1'b0;  d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end 
		
		
		//XOR
		//add 0 (rx_out, a_in)
		8'b01100: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//add 1 (ry_out, g_in, xor_ctrl)
		8'b01101: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b1; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b1; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//add 2 (g_out, rx_in)
		8'b01110: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b1; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end 
			
		//push
		8'b10011: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b10100: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b10101: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b1; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b10110: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b10; sp_enable = 1'b1; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		//pop
		8'b10111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b01; sp_enable = 1'b1; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11000: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11001: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11010: begin ctrl_out = 1'b0; rx_in = 1'b1; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b1; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b0;  sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		//call
		8'b11011: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11100: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11101: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b1; instr_enable = 1'b1; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11110: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b11111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b1; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b1; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b100000: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b10; sp_enable = 1'b1; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b100101: begin ctrl_out = 1'b1; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b1; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b10; sp_enable = 1'b1; d_select = 1'b1; SR_enable = 1'b0; sr_sel = 1'b0; end
		//ret
		8'b100001: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b01; sp_enable = 1'b1; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b100010: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b100011: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b100100: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b1; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b1; ram_out_ctrl = 1'b1; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end

		//CP
		8'b100110: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b1; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b1; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end 
		8'b100111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b1; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b1; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b1; sr_sel = 1'b1; end
		//BREQ/brlo/brhi
		// s1 increment PC
		8'b101001: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b101110: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		8'b101111: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		
		// s2 wait
		8'b101010: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0;  SR_enable = 1'b0; sr_sel = 1'b0; end
		// s3 (not branching) increment pc
		8'b101011: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0; SR_enable = 1'b0; sr_sel = 1'b0; end
		//s4 load new instr
		8'b101100: begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b1; instr_enable = 1'b1; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0;  SR_enable = 1'b0; sr_sel = 1'b0; end
		//s5 PC to new instr
		8'b101101: begin ctrl_out = 1'b1; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b1; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b1; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b1;  SR_enable = 1'b0; sr_sel = 1'b0; end
		
		//Mul
		//Mul0 (a in the a register, which is r9 in register a)
		8'b00101000: begin 
		8'b00010000: begin
		8'b00010001: begin
		8'b00010010: begin
		:	
		
		default  : begin ctrl_out = 1'b0; rx_in = 1'b0; rx_out = 1'b0; ry_in = 1'b0; ry_out = 1'b0; gin = 1'b0; gout = 1'b0; pcin = 1'b0; pcout = 1'b0; addsub = 1'b0; a_in = 1'b0; xorctrl = 1'b0; ram_addr_sel = 1'b0; ram_out_ctrl = 1'b0; instr_enable = 1'b0; pc_enable = 1'b0; wr_enable = 1'b0; sp_sel = 2'b00; sp_enable = 1'b0; d_select = 1'b0;  SR_enable = 1'b0; sr_sel = 1'b0; end
		
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