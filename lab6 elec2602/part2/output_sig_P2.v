module output_sig_P2(state,w, led_out, counter_rst);


input [2:0] state;
input w;
output reg led_out;
output reg counter_rst;
wire[3:0] temp;


assign temp = {state, w};

always @(temp) begin
	casez (temp)
	4'b0000 : begin counter_rst = 1'b1; led_out = 1'b0; end
	4'b0001 : begin counter_rst = 1'b1; led_out = 1'b0; end
	4'b0011 : begin counter_rst = 1'b1; led_out = 1'b0; end
	4'b0110: begin counter_rst = 1'b1; led_out = 1'b0; end
	4'b010z: begin led_out = 1'b1; counter_rst = 1'b1; end
	4'b100z : begin led_out = 1'b1; counter_rst = 1'b1; end
	
	default : begin led_out = 1'b0; counter_rst = 1'b0; end
	
	endcase
	end
	
endmodule