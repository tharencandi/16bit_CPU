
load r7 h0                  // r7 is a counter for how many times the entire program has run
load r6 h10                 // we want the program to only run 10 times
start:                      // start of program

add r7 r4                   // count += 1
cp r7 r6                    // if counter = 10 go done
breq done


call init_values            // initialise all registers to start new loop

ldpc r5                     // setup to branch
cp rx r0                    // see if rx has reached 0, if it hasrestart 
brhi start 
call inner_loop             // do inner loop
sub rx r4                   // decrease x
branch r5

                            // inner loop will do rx*1, rx*10, rx*100, rx*1000 then return
inner_loop:
    cp ry r1
    mul rx ry
    mul ry r6               //Y = Y*10
    brlo inner_loop
    ret

init_values:
    load r0 h0              // r0 is a zero constant
    load r1 h1000           // max value of Y
    load rx hf              // X starts at F goes to 0
    load ry h0              // Y starts at 0                   
    load r4 h1              //r4 is a 1 constant
    ret

done: