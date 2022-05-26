module n1s_n0s_TB;

reg [3:0] count;
reg rst, w,save, clk;
reg[3:0] n;
wire led_out;

n1s_n0s inst_n1_n0(.rst(rst), .n(n), .w(w), .save(save), .clk(clk), .led_out(led_out));


initial begin 
		count = 4'b0000;
		clk = 1'b0;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	

	always begin
		#25
		clk = 1'b1;
		#25
		clk = 1'b0;
	end	
	
always @(count) begin
	case (count)
	4'b0000 : begin rst = 1'b0 ; n = 4'b0110 ; save = 1'b1 ; end

	
	default : begin rst = 1'b0 ; n = 4'b0 ; save = 1'b0 ; end
	endcase
	

end
	
endmodule