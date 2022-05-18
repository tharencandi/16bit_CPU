module lab6_p1_TB;

reg [3:0] count;
reg rst, w, clk;
wire z;

four1s_four0s inst_poo(.w(w), .z(z), .rst(rst), .clk(clk));


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
	4'b0000 : begin rst = 1'b1 ; w = 1'b0; end
	4'b0001 : begin rst = 1'b0 ; w = 1'b0; end
	4'b0010 : begin rst = 1'b0 ; w = 1'b0; end
	4'b0011 : begin rst = 1'b0 ; w = 1'b0; end
	4'b0100 : begin rst = 1'b0 ; w = 1'b0; end
	
	4'b0101 : begin rst = 1'b1 ; w = 1'b0; end
	4'b0110 : begin rst = 1'b0 ; w = 1'b1; end
	4'b0111 : begin rst = 1'b0 ; w = 1'b1; end
	4'b1000 : begin rst = 1'b0 ; w = 1'b1; end
	4'b1001 : begin rst = 1'b0 ; w = 1'b1; end
	default : begin rst = 1'b0 ; w = 1'b0; end
	endcase
	
	end
	
endmodule