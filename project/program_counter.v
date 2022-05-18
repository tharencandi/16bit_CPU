module program_counter(clk, rst, bus, select, pc_enable, out);
	
	input clk, rst, pc_enable, select;
	input [15:0] bus;
	output reg [15:0] out;
	reg mux_out;
	
	always @(select) begin
		if (select == 1'b0)
		mux_out <= out + 1;
		else
		mux_out <= bus;
	end
	
	always @(posedge clk or posedge rst) begin

		if (rst == 1'b1)
			out <= 16'b0;
		else if (pc_enable == 1'b1)
			out <= mux_out;
		end
		
		//sixteen_bit_reg pc_reg(.D(mux_out), .clk(clk), .rst(rst), .Q(out), .enable(pc_enable));
endmodule
			
			
		
			
		



	

	
