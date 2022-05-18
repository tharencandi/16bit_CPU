module mux2_1(in1, in2, select, out);
//if select is 0, + 1, if select is 1, take the value of bus
input in1, in2, select;
output out;

if(select <=0)
out <= in1 + 1 

if (select <=1)
out <= bus 
  
 

endmodule
