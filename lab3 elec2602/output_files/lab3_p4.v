module lab3_p4(a,b, cin, display1, display2, warning);

input [3:0] a, b;
input cin;
output [6:0] display1, display2;
output warning;
wire [4:0] sum;

comparator_7seg c7s_inst(.a(a), .b(b), .z(warning));

fourBit_FA fa_inst(.a(a),.b(b),.cin(cin),.cout(sum[4]),.s(sum[3:0]));

lab3_p2_v2 displ_inst(.v(sum[3:0]), .d1(display1), .d2(display2));

endmodule