module ram
(
	input [15:0] data,
	input [7:0] address,
	input write_enable, clk, rst;
	output [15:0] out
);

	// Declare the RAM variable
	reg [15:0] ram[255:0];
	
	// Variable to hold the registered read address
	reg [7:0] addr_reg;
	
	always @ (posedge clk)
	begin
	// Write
		if (write_enable)
			ram[address] <= data;

		else if (rst == 1'b1)
			out <= 16'b0000000000000000;
		else 
			out <= data;

		addr_reg <= addr;
		
	end
		
	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign out = ram[addr_reg];
	
endmodule
//DONT USE OLD
