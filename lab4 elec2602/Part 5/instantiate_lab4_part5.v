module instantiate_lab4_part5(SW,HEX0,HEX1,HEX2,HEX3,KEY);

input[9:0] SW;
input[3:0] KEY;
output[6:0] HEX1;
output[6:0] HEX2;
output[6:0] HEX3;
output[6:0] HEX0;

fourHexDisplay inst_fourHexdispl(.num1(SW[3:0]), .num2(SW[7:4]), .clk(KEY[1]), .rst(KEY[0]), .a2_h(HEX3), .a1_h(HEX2), .b2_h(HEX1), .b1_h(HEX0));

endmodule

