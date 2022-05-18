`timescale 1ns / 1ps

module seven_seg_controller_TB;
	
	reg [3:0] count;
	reg clk;
	reg [15:0] r1, r2, r3, r4, r5, r6, r7, r8;
	reg [2:0] sw;
	wire [27:0] displ;
	
	seven_seg_controller seven_seg_inst(.sw(sw), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .r8(r8), .displ(displ));
	
	initial begin 
		count = 4'b0000;
		clk =1'b0;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always begin
		#100
		clk = 1'b0;
		#100
		clk = 1'b1;
	end	

	
	always @(count) begin
		case (count)
		4'b0000 : begin sw = 3'b000; r1 = 16'b1; r2 = 16'b0; r3 = 16'b0; r4 = 16'b0; r5 = 16'b0; r6 = 16'b0; r7 = 16'b0; r8 = 16'b0; end
		4'b0001 : begin sw = 3'b001; r1 = 16'b0; r2 = 16'b10; r3 = 16'b0; r4 = 16'b0; r5 = 16'b0; r6 = 16'b0; r7 = 16'b0; r8 = 16'b0; end
		4'b0010 : begin sw = 3'b010; r1 = 16'b0; r2 = 16'b0; r3 = 16'b1; r4 = 16'b0; r5 = 16'b0; r6 = 16'b0; r7 = 16'b0; r8 = 16'b0; end
		4'b0011 : begin sw = 3'b011; r1 = 16'b0; r2 = 16'b0; r3 = 16'b0; r4 = 16'b1; r5 = 16'b0; r6 = 16'b0; r7 = 16'b0; r8 = 16'b0; end
		4'b0100 : begin sw = 3'b100; r1 = 16'b0; r2 = 16'b0; r3 = 16'b0; r4 = 16'b0; r5 = 16'b1; r6 = 16'b0; r7 = 16'b0; r8 = 16'b0; end
		4'b0101 : begin sw = 3'b101; r1 = 16'b0; r2 = 16'b0; r3 = 16'b0; r4 = 16'b0; r5 = 16'b0; r6 = 16'b1; r7 = 16'b0; r8 = 16'b0; end
		4'b0110 : begin sw = 3'b110; r1 = 16'b0; r2 = 16'b0; r3 = 16'b0; r4 = 16'b0; r5 = 16'b0; r6 = 16'b0; r7 = 16'b1; r8 = 16'b0; end 
		4'b0111 : begin sw = 3'b111; r1 = 16'b0; r2 = 16'b0; r3 = 16'b0; r4 = 16'b0; r5 = 16'b0; r6 = 16'b0; r7 = 16'b0; r8 = 16'b1; end
	endcase
	end

 
endmodule