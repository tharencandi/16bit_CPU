module alu(clk, rst, a, b, addsub, xor_ctrl, acc_out, acc_enable, a_enable, mul_acc_out, mul_out_ctrl);
	
	
	input clk, rst, addsub, xor_ctrl, acc_enable, a_enable, mul_out_ctrl;
	
	input[15:0] a,b;
	output[15:0] out;
	output[15:0] mul_acc_out;
	
	wire [15:0] add_out, xor_out, acc_in, a_reg, l_m_out, r_m_out;
	reg [15:0] b_mux;
	
	
	// multiplex for b
	always @(b or addsub) begin
		if (addsub == 1'b1)
			b_mux = ~b;
		else 
			b_mux = b;
	end
	 
	
	sixteen_bit_reg a_register(.D(a), .clk(clk), .rst(rst), .Q(a_reg), .enable(a_enable));
	
	
	sixteenBit_FA adder_circuit(.a(a_reg),.b(b_mux),.cin(addsub),.cout(),.s(add_out));
	sixteen_bit_xor xor_circuit(.a(a_reg),.b(b),.out(xor_out));
	sixteen_bit_multiplier multiplier(.a(a_reg), .b(b), .l_m(l_m_out), .r_m(r_m_out))
	
	
	
	buff add_buffer(.a(add_out),.b(acc_in),.enable(~xor_ctrl));
	buff xor_buffer(.a(xor_out),.b(acc_in),.enable(xor_ctrl));
	buff mul_buffer(.a(l_m_out), .b(acc_in), .enable(mul_out_ctrl));

	sixteen_bit_reg accumulator(.D(acc_in), .clk(clk), .rst(rst), .Q(out), .enable(acc_enable));
	sixteen_bit_reg mul_accumulator(.D(r_m_out), .clk(clk), .rst(rst), .Q(mul_acc_out), .enable(acc_enable));
endmodule