module status_register_encoder(add_out, c_out, status_reg);

input[15:0] add_out;
input c_out;
output[3:0] status_reg;

wire[16:0] status;

assign status = {add_out, c_out); 

always @(status) begin
	casez(status)

//zero flag
17'b00000000000000000 : begin status_reg = 4'b0010; end
17'b00000000000000001 : begin status_reg = 4'b0011; end
//neg flag
17'b1zzzzzzzzzzzzzzz0 : begin status_reg = 4'b1000; end
17'b1zzzzzzzzzzzzzzz1 : begin status_reg = 4'b1001; end
//pos flag
17'b0zzzzzzzzzzzzzzz0 : begin status_reg = 4'b0100; end
17'b0zzzzzzzzzzzzzzz1 : begin status_reg = 4'b0101; end

endcase
endmodule
