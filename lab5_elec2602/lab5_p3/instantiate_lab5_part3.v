module instantiate_lab5_part3(HEX0, HEX1, HEX2, HEX3, CLOCK_50, KEY);

input CLOCK_50;
input[3:0] KEY;
output[6:0] HEX0;
output[6:0] HEX1;
output[6:0] HEX2;
output[6:0] HEX3;
wire[15:0] Q;

second_count_50clk inst_secondcount(.clk(CLOCK_50),.out(Q), .rst(KEY[0]));

binary_to_7Seg binary_to_7Seg_0(.binary(Q[3:0]), .sevenSeg(HEX0));
binary_to_7Seg binary_to_7Seg_1(.binary(Q[7:4]), .sevenSeg(HEX1));
binary_to_7Seg binary_to_7Seg_2(.binary(Q[11:8]), .sevenSeg(HEX2));
binary_to_7Seg binary_to_7Seg_3(.binary(Q[15:12]), .sevenSeg(HEX3));

endmodule