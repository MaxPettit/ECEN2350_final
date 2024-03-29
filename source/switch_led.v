module switch_led (SW, KEY, led);

   input [9:0] SW;
   input [1:0] KEY;
   output [9:0] led;

   assign led[8] = SW[8];
   assign led[9] = SW[9];
   

   assign led[0] = ~SW[0] ^ KEY[0];
   assign led[1] = ~SW[1] ^ KEY[0];
   assign led[2] = ~SW[2] ^ KEY[0];
   assign led[3] = ~SW[3] ^ KEY[0];
   assign led[4] = ~SW[4] ^ KEY[0];
   assign led[5] = ~SW[5] ^ KEY[0];
   assign led[6] = ~SW[6] ^ KEY[0];
   assign led[7] = ~SW[7] ^ KEY[0];
   
 
endmodule
