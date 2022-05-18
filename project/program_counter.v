module program_counter(clk, rst, p_in, bus, select, pc_enable, out);
	
	input clk, rst, pc_enable;
	input [15:0] bus, p_in;
	output [15:0] out;
	wire mux_out;
	
	always @(select) begin
		if (select == 1'b0)
		mux_out <= p_in + 1 
	if (select <= 1)
		mux_out <= bus
	end
		sixteen_bit_reg pc_reg(.D(mux_out) .clk(clk) .rst(rst) .Q(out) .enable(pc_enable)) 
endmodule
			
			
		
			
		



	

	
