module alu(clk, rst, a, b, addsub, xor_ctrl, out, acc_enable, a_enable);
	
	
	input clk, rst, addsub, xor_ctrl, acc_enable, a_enable;
	
	input[15:0] a,b;
	output[15:0] out;
	
	wire [15:0] add_out, xor_out, acc_in, a_reg;
	reg [15:0] b_mux;
	
	
	// multiplex for b
	always @(b or addsub) begin
		if (addsub == 1'b1)
			assign b_mux = ~b;
		else 
			assign b_mux = b;
	end
	 
	
	sixteen_bit_reg a_register(.D(a), .clk(clk), .rst(rst), .Q(a_reg), .enable(a_enable));
	
	
	sixteenBit_FA adder_circuit(.a(a_reg),.b(b_mux),.cin(addsub),.cout(),.s(add_out));
	sixteen_bit_xor xor_circuit(.a(a_reg),.b(b),.out(xor_out));
	
	
	buff add_buffer(.a(add_out),.b(acc_in),.enable(~xor_ctrl));
	buff xor_buffer(.a(xor_out),.b(acc_in),.enable(xor_ctrl));

	sixteen_bit_reg accumulator(.D(acc_in), .clk(clk), .rst(rst), .Q(out), .enable(acc_enable));
endmodule