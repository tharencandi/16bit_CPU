module lab5_part3_TB;

reg [15:0] count;
reg clk, clr;
wire[25:0] Q;


fiftyMHz_counter inst_counter(.clk(clk), .Q(Q), .clr(clr));


initial begin 
		count = 16'b0000000000000000;
		clk = 1'b0;
	end
	
	always begin
		#50
		count=count+16'b0000000000000001;
	end
	

	always begin
		#1
		clk = 1'b1;
		#1
		clk = 1'b0;
	end	

	always @(count) begin
		case (count)
		16'b0000000000000000 : begin clr = 1'b1; end
		16'b0000000000000001 : begin clr = 1'b0; end

		//default : ... end 
	endcase
	end

endmodule