module inst_seq_detect(SW[1:0], KEY[3:0], HEX0, LED[9:0]); 

input[1:0] SW;
input[3:0] KEY;
output reg[9:0] LED;
output[6:0] HEX0;
wire z;
wire[3:0] curr_state;

four1s_four0s inst_seq(.w(SW[1]), .z(z), .rst(SW[0]), .clk(KEY[0]), .curr_state(curr_state));


always @(z) begin
	if (z == 1'b1)
		LED = 10'b1111111111;
	else 
		LED = 10'b0000000000;
end


binary_to_7Seg seg0(.binary(curr_state),.sevenSeg(HEX0));

endmodule