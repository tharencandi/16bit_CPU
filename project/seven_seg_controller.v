module seven_seg_controller(sw, r0, r1, r2, r3, r4, r5, r6, r7, r8,r9,r10,r11,r12,r13,r14,r15, displ);

//input SW[2:0] -> 's'
//display the values held in the register selected by the switches using mux
//output this value on the seven seg displays

input[3:0] sw; // -> 's'
input[15:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15; // -> u,v,w,x...
reg[15:0] val;
output[27:0] displ; // -> 'm'

//disp needs to be in 4 parts for 4 hexs -> 16b number 4 hex displ ->7b out each

always @(sw or r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7 or r8 or r9 or r10 or r11 or r12 or r13 or r14 or r15) begin
	case (sw)
	4'b000 : begin val = r0; end
	4'b001 : begin val = r1; end
	4'b010 : begin val = r2; end
	4'b011 : begin val = r3; end
	4'b100 : begin val = r4; end
	4'b101 : begin val = r5; end
	4'b110 : begin val = r6; end
	4'b111 : begin val = r7; end
	4'b1000 : begin val = r8; end
	4'b1001 : begin val = r9; end
	4'b1010 : begin val = r10; end
	4'b1011 : begin val = r11; end
	4'b1100 : begin val = r12; end
	4'b1101 : begin val = r13; end
	4'b1110 : begin val = r14; end
	4'b1111 : begin val = r15; end
endcase
end

binary_to_7Seg bin2seg_inst0(.binary(val[3:0]), .sevenSeg(displ[6:0]));
binary_to_7Seg bin2seg_inst1(.binary(val[7:4]), .sevenSeg(displ[13:7]));
binary_to_7Seg bin2seg_inst2(.binary(val[11:8]), .sevenSeg(displ[20:14]));
binary_to_7Seg bin2seg_inst3(.binary(val[15:12]), .sevenSeg(displ[27:21]));

endmodule