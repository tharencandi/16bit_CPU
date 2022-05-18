module seven_seg_controller(sw, r1, r2, r3, r4, r5, r6, r7, r8, displ);

//input SW[2:0] -> 's'
//display the values held in the register selected by the switches using mux
//output this value on the seven seg displays

input[2:0] sw; // -> 's'
input[15:0] r1,r2,r3,r4,r5,r6,r7,r8; // -> u,v,w,x...
reg[15:0] val;
output[27:0] displ; // -> 'm'

//disp needs to be in 4 parts for 4 hexs -> 16b number 4 hex displ ->7b out each

always @(sw) begin
	case (sw)
	3'b000 : begin val = r1; end
	3'b001 : begin val = r2; end
	3'b010 : begin val = r3; end
	3'b011 : begin val = r4; end
	3'b100 : begin val = r5; end
	3'b101 : begin val = r6; end
	3'b110 : begin val = r7; end
	3'b111 : begin val = r8; end
endcase
end

binary_to_7Seg bin2seg_inst0(.binary(val[3:0]), .sevenSeg(displ[6:0]));
binary_to_7Seg bin2seg_inst1(.binary(val[7:4]), .sevenSeg(displ[13:7]));
binary_to_7Seg bin2seg_inst2(.binary(val[11:8]), .sevenSeg(displ[20:14]));
binary_to_7Seg bin2seg_inst3(.binary(val[15:12]), .sevenSeg(displ[27:21]));

endmodule