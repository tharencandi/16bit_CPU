module control_unit 
	(
		clk, rst, instr, rin, 
		rout, gin, gout, pcin, 
		pcout, addsub, a_in, 
		xorctrl, ctrl_out, 
		out, new_instr,instr_ctrl	
	);
	
	input clk, rst, new_instr;
	input [15:0]instr;
	output [7:0] rin, rout;
	output gin, gout, pcin, pcout, addsub, a_in, xorctrl , ctrl_out, instr_ctrl;
	output [15:0] out;
	
	//instr: f2f1f0rx2rx1fx0 (ry2ry1ry0 0000000000| D7D6D5D4D3D2D1D0 00) 
	assign out = {8'b0,instr[7:0]};
	
	wire [3:0] curr_state, next_state;
	
	
	four_bit_reg state_reg(.D(next_state),.clk(clk),.rst(rst),.Q(curr_state));
	
	next_state inst_next_state(.instr(instr),.state(curr_state),.next_state(next_state),.new_instr(new_instr));
	
	control_output get_outputs(.state(curr_state),.instr(instr),.rin(rin), .rout(rout), .gin(gin), .gout(gout)
		, .pcin(pcin), .pcout(pcout), .addsub(addsub),.a_in(a_in), .xorctrl(xorctrl) , .ctrl_out(ctrl_out));
		
endmodule

	