load r0 hFF
load r1 h01
call subroutine1
mov r2 r0
ldpc r7

subroutine1:

sub r0 r1
branch r7
ret
