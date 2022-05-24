module status_register_encoder(add_out, c_out, status_reg);

input[15:0] add_out;
input c_out;
output [3:0] status_reg;

reg p,n,z,c;
assign status_reg = {n, p, z, c};


always @(add_out or c_out) begin
	if (add_out[15] == 1'b1)
		n = 1'b1;
	else
		n = 1'b0;
	
	if (add_out[15] == 1'b0)
		p = 1'b1;
	else 
		p = 1'b0;
	
	if (c_out == 1'b1)
		c = 1'b1;
	else
		c = 1'b0;
	
	if (add_out == 16'b0)
		z = 1'b1;
	else
		z = 1'b0;
end

endmodule
