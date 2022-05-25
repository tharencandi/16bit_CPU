module control_unit 
	(
		clk, rst, instr, rin, 
		rout, gin, gout, pcin, 
		pcout, addsub, a_in, 
		xorctrl, ctrl_out, 
		out,ram_addr_sel, ram_out_ctrl, instr_enable, pc_enable, wr_enable, sp_sel, sr_sel, current_status,
		mul_out_ctrl, mul_acc_out_ctrl, add_ctrl	
	);
	
	input clk, rst;
	input [3:0] current_status;
	input [15:0]instr;
	output [15:0] rin, rout;
	output gin, gout, pcin, pcout, addsub, a_in, xorctrl , ctrl_out, ram_addr_sel, ram_out_ctrl, instr_enable, pc_enable, wr_enable, sr_sel, mul_out_ctrl, mul_acc_out_ctrl,add_ctrl;
	output reg [15:0] out;
	output [1:0] sp_sel;
	wire d_select;
	
	//instr: f2f1f0rx2rx1fx0 (ry2ry1ry0 0000000000| D7D6D5D4D3D2D1D0 00) 
	always @(d_select or instr) begin
		if (d_select == 1'b0)
			out = {8'b0,instr[7:0]};
		else 
			out = instr;
	end
	
	
	wire [7:0] curr_state, next_state;
	
	
	eight_bit_reg state_reg(.D(next_state),.clk(clk),.rst(rst),.Q(curr_state));
	
	next_state inst_next_state(.instr(instr),.state(curr_state),.next_state(next_state), .status_reg(current_status));
	
	control_output get_outputs(.state(curr_state),.instr(instr),.rin(rin), .rout(rout), .gin(gin), .gout(gout)
		, .pcin(pcin), .pcout(pcout), .addsub(addsub),.a_in(a_in), .xorctrl(xorctrl) , .ctrl_out(ctrl_out),
		.ram_addr_sel(ram_addr_sel), .ram_out_ctrl(ram_out_ctrl), .instr_enable(instr_enable), .pc_enable(pc_enable),
		.wr_enable(wr_enable), .sp_sel(sp_sel), .d_select(d_select), .sr_sel(sr_sel),
		.mul_out_ctrl(mul_out_ctrl), .mul_acc_out_ctrl(mul_acc_out_ctrl),.add_ctrl(add_ctrl)	
		);
		
endmodule

	