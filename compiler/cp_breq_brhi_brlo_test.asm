load r0 h1
load r1 h2
load r3 h3

cp r1 r0
brhi higher
add r0 r1 // r0 =3

higher:

cp r0 r3
brlo lower
sub r3 r0 //r3 = 0

lower:

add r0 r1
cp r0 r3
breq equal
sub r3 r0 // r3 = -3

equal:
add r3 r0

