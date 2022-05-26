module int_n1s_n0s(SW[9:0], KEY[3:0], HEX0, LED[9:0]); 

input[9:0] SW;
input[3:0] KEY;
output reg[9:0] LED;
output[6:0] HEX0;
wire z;
wire[3:0] current_state;
n1s_n0s thing(.rst(SW[0]), .n(SW[9:6]), .w(SW[1]), .save(KEY[3]), .clk(KEY[0]), .led_out(z), .current_state(current_state));


binary_to_7Seg display(.binary(SW[9:6]), .sevenSeg(HEX0));


always @(z) begin
	if (z == 1'b1)
		LED = 10'b1111111111;
	else 
		LED = 10'b0000000000;
end
endmodule