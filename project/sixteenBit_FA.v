module FA(a,b,cin,cout,s);
	//all inputs and outputs are 1-bit
	input a, b, cin;
	output cout, s;
	assign s = (~a & b & ~cin) | (a & ~b & ~cin) | (~a & ~b & cin) | (a & b & cin);
	assign cout = (a & b) | (a & cin) | (b & cin);
	
	
endmodule

module sixteenBit_FA(a,b,cin,cout,s);
	//some inputs and outputs are 1-bit, some are 4-bit
	input [15:0] a, b;
	input cin;
	output [15:0] s;
	output cout;
	
	wire c1, c2, c3;
	wire[14:0] c_outs;
	
	FA fa1(.a(a[0]), .b(b[0]), .cin(cin), .cout(c_outs[0]), .s(s[0]));
	FA fa2(.a(a[1]), .b(b[1]), .cin(c_outs[0]), .cout(c_outs[1]), .s(s[1]));
	FA fa3(.a(a[2]), .b(b[2]), .cin(c_outs[1]), .cout(c_outs[2]), .s(s[2]));
	FA fa4(.a(a[3]), .b(b[3]), .cin(c_outs[2]), .cout(c_outs[3]), .s(s[3]));

	FA fa5(.a(a[4]), .b(b[4]), .cin(c_outs[3]), .cout(c_outs[4]), .s(s[4]));
	FA fa6(.a(a[5]), .b(b[5]), .cin(c_outs[4]), .cout(c_outs[5]), .s(s[5]));
	FA fa7(.a(a[6]), .b(b[6]), .cin(c_outs[5]), .cout(c_outs[6]), .s(s[6]));
	FA fa8(.a(a[7]), .b(b[7]), .cin(c_outs[6]), .cout(c_outs[7]), .s(s[7]));

	FA fa9(.a(a[8]), .b(b[8]), .cin(c_outs[7]), .cout(c_outs[8]), .s(s[8]));
	FA fa10(.a(a[9]), .b(b[9]), .cin(c_outs[8]), .cout(c_outs[9]), .s(s[9]));
	FA fa11(.a(a[10]), .b(b[10]), .cin(c_outs[9]), .cout(c_outs[10]), .s(s[10]));
	FA fa12(.a(a[11]), .b(b[11]), .cin(c_outs[10]), .cout(c_outs[11]), .s(s[11]));

	FA fa13(.a(a[12]), .b(b[12]), .cin(c_outs[11]), .cout(c_outs[12]), .s(s[12]));
	FA fa14(.a(a[13]), .b(b[13]), .cin(c_outs[12]), .cout(c_outs[13]), .s(s[13]));
	FA fa15(.a(a[14]), .b(b[14]), .cin(c_outs[13]), .cout(c_outs[14]), .s(s[14]));
	FA fa16(.a(a[15]), .b(b[15]), .cin(c_outs[14]), .cout(cout), .s(s[15]));

endmodule