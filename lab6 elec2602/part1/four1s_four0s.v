module four1s_four0s(w, z, rst, clk, curr_state);

input w,rst,clk;
output z;
output [3:0] curr_state;
wire [3:0] next_state;

state_reg inst_statereg(.D(next_state),.clk(clk),.rst(rst),.Q(curr_state));

next_state ins_nextstate(.w(w), .state(curr_state), .next_state(next_state));

output_sig ins_outputsig(.state(curr_state), .out(z));

endmodule