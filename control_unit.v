module control_unit(clk, rst, instr, rin, rout, gin, gout, pcin, pcout, addsub, xorctrl)
	
	input clk, rst;
	input [15:0]instr;
	output [7:0] rin, rout;
	output gin, gout, pcin, pcout, addsub, addsub, xorctrl;
	
	wire [3:0] curr_state, next_state;
	
	
	four_bit_reg state_reg(.D(next_state),.clk(clk),.rst(rst),.Q(curr_state));
	
	next_state inst_next_state(.instr(instr),.state(curr_state),.next_state(next_state));
	
	control_output get_outputs(.state(curr_state),.rin(rin), .rout(rout), .gin(gin), .gout(gout)
		, .pcin(pcin), .pcout(pcout), .addsub(addsub), .xorctrl(xorctrl));
		
endmodule

	