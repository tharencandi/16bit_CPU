module n1s_n0s(rst, n, w, save, clk, led_out);

input rst, w,save, clk;
input[3:0] n;
output led_out;

wire[2:0] current_state, next_state;
wire counter_rst,c;
wire[3:0] saved_n;

state_reg four_bit_reg(.D(n),.rst(rst),.Q(saved_n),.clk(save));

// saves n and counts to n and outputs c = 1 when counter reached
counter_module counter_thing(.n(saved_n),.rst(counter_rst | rst), .clk(clk), .enable(~counter_rst), .c(c));

output_sig_P2 get_out(.state(current_state),.w(w), .led_out(led_out), .counter_rst(counter_rst));

next_state_P2 get_state(.w(w), .state(current_state), .next_state(next_state),.c(c));

threebit_state_reg_P2 state_reg(.D(next_state),.clk(clk),.rst(rst),.Q(current_state));

endmodule