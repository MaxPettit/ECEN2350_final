`timescale 1 ns / 100 ps

module complete_tb();

   reg [9:0] SW;
   reg [1:0] KEY;
   
   wire [9:0] LED;
   wire [7:0] HEX0;
   wire [7:0] HEX1;
   wire [7:0] HEX2;
   wire [7:0] HEX3;
   wire [7:0] HEX4;
   wire [7:0] HEX5;
   

   Complete U1 (
		.SW(SW),
		.KEY(KEY),
		.LEDR(LED),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.HEX5(HEX5)
		);
   

   initial  
     begin
	$dumpfile("out_complete.vcd");
	$dumpvars;
	$display("Starting simulation");

	SW[0] = 1;
	SW[1] = 1;
	SW[2] = 1;
	SW[3] = 1;
	SW[4] = 1;
	SW[5] = 0;
	SW[6] = 0;
	SW[7] = 0;
	SW[8] = 0;
	SW[9] = 0;

	KEY[0] = 1;
	KEY[1] = 1;
	
        
	// Block 1 
	#10   KEY[0] = 0;
	SW[6] = 1;
	KEY[1] = 0;
	
	#10   KEY[1] = 0;
	KEY[1] = 1;
    
	#10   KEY[0] = 1;
	#10   KEY[1] = 0;
	KEY[1] = 1;
	KEY[1] = 0;
	
	


	// Block 2
	#10 SW[8] = 1;
	#10 	SW[0] = 0;
	SW[1] = 1;
	SW[2] = 0;
	SW[3] = 0;
	SW[4] = 1;
	SW[5] = 0;	
	SW[6] = 1;
	SW[7] = 0;


	// Block 3
	#10 SW[9] = 1;
	SW[8] = 0;
	
	#10 	SW[0] = 0;
	SW[1] = 1;
	SW[2] = 0;
	SW[3] = 0;
	SW[4] = 1;
	SW[5] = 0;	
	SW[6] = 1;
	SW[7] = 0;

	#10 SW[1] = 0;
	SW[2] = 0;
	SW[3] = 1;
	SW[4] = 1;
	SW[5] = 0;
	SW[6] = 1;
	SW[7] = 0;

	#10 SW[8] = 1;
	#10 	SW[0] = 0;
	SW[1] = 1;
	SW[2] = 0;
	SW[3] = 0;
	SW[4] = 1;
	SW[5] = 0;	
	SW[6] = 1;
	SW[7] = 0;
	
	
	
	#10   $display("Simulation ended.");
	$finish;  
     end // initial begin

   /*initial    
     begin      
	$monitor($time, "  KEY[5] = %b,  KEY[1] = %b,  LED[0] = %b LED[5] = %b", KEY[5], KEY[1], LED[0], LED[5]);    
     end*/
   
endmodule // block1_tb
