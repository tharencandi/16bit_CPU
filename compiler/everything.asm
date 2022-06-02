load r7 h00                  // r7 is a counter for how many times the entire program has run
load r6 h0A                 	// we want the program to only run d10 times
load r4 h01              //r4 is a 1 constant
start:                      // start of program

add r7 r4                   // count += 1
cp r7 r6                    // if counter = 10 go done
breq done

call init_values            // initialise all registers to start new loop

ldpc r5                     // setup to branch
cp rx r0                    // see if rx has reached 0, if it hasrestart 
breq start 
mov rz rx
call inner_loop             // do inner loop
sub rx r4                   // decrease x
branch r5

                            // inner loop will do rx*10, rx*100, rx*1000 then return
inner_loop:
    cp ry r1
    mul rx ry
    add ry r4               //Y += 1
    brlo inner_loop
	mov rx rz
    ret

init_values:
    load r0 h00              // r0 is a zero constant
    load r1 h03          	// max value of Y
    load rx h0f              // X starts at F goes to 0
    load ry h00             	// Y starts at 0 
    ret

done: