`timescale 1ns / 1ps
 
module control_unit_TB;
 
	// ------------------ Instantiate module ------------------
	// We are instantiating the module mux2, naming it instantiate_mux2.
	// select, input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg [4:0] count;
	reg clk, rst, new_instr;
	reg [15:0] instr;
	
	wire gin, gout, pcin, pcout, addsub, a_in, xorctrl, ctrl_out;
	wire [15:0] bus_out;
	wire [7:0] rin,rout;
	
	
	control_unit cu_inst(.clk(clk),.new_instr(new_instr), .rst(rst), .instr(instr), .rin(rin), .rout(rout), .gin(gin), .gout(gout), .pcin(pcin), .pcout(pcout), .addsub(addsub),.a_in(a_in), .xorctrl(xorctrl), .ctrl_out(ctrl_out), .out(bus_out));
 	
	initial begin 
		count = 5'b0;
		clk = 1'b1;
	end
	
	always begin
		
		#50
		clk = 1'b0;
		count=count+4'b0001;

		#50
		clk = 1'b1;
		
	end
	
	always @(count) begin
		case (count)
		5'b00000 : begin rst = 1'b1; instr = 16'b0; new_instr = 1'b0; end
		5'b00001 : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b1; end
		
		5'b00010 : begin rst = 1'b0; instr = 16'b0000001011111111; new_instr = 1'b0; end // load load rx = 2 d = 11111111
		5'b00011 : begin rst = 1'b0; instr = 16'b0000001011111111; new_instr = 1'b0; end // execute 
		5'b00100 : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b1; end // wait one clock cycle to go back to state 0.
		
		5'b00101 : begin rst = 1'b0; instr = 16'b0001011000010000; new_instr = 1'b0; end // load move rx = 7 ry = 1
		5'b00110 : begin rst = 1'b0; instr = 16'b0001011000010000; new_instr = 1'b0; end // execute
		5'b00111 : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b1; end// wait 
	
		5'b01000 : begin rst = 1'b0; instr = 16'b0101011100000000; new_instr = 1'b0; end // load ldpc rx = 8
		5'b01001 : begin rst = 1'b0; instr = 16'b0101011100000000; new_instr = 1'b0; end // execute
		5'b01010 : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b1; end// wait 
		
		5'b01011 : begin rst = 1'b0; instr = 16'b0110011100000000; new_instr = 1'b0; end // load branch
		5'b01100 : begin rst = 1'b0; instr = 16'b0110011100000000; new_instr = 1'b0; end // execute branch rx = 8
		5'b01101 : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b1; end// wait 
		
		5'b01110 : begin rst = 1'b0; instr = 16'b0010001001100000; new_instr = 1'b0; end // load add rx = 0010 ry = 0110
		5'b01111 : begin rst = 1'b0; instr = 16'b0010001001100000; new_instr = 1'b0; end // load add rx = 0010 ry = 0110
		5'b10000 : begin rst = 1'b0; instr = 16'b0010001001100000; new_instr = 1'b0; end// wait
		5'b10001 : begin rst = 1'b0; instr = 16'b0010001001100000; new_instr = 1'b0; end// wait
		5'b10010 : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b1; end// wait 		
		
		default : begin rst = 1'b0; instr = 16'b0; new_instr = 1'b0; end
	endcase
	end

 
endmodule
