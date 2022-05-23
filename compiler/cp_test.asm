load r0 h00
load r1 b00000001
load r2 h0A

loop:

add r0 r1
cp r0 r2
brlo loop
