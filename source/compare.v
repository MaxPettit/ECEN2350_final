module compare(
	       input [1:0]  KEY,
	       input [9:0]  SW,

	       output [7:0] HEX0,
	       output [7:0] HEX1,
	       output [7:0] HEX2,
	       output [7:0] HEX3,
	       output [7:0] HEX4,
	       output [7:0] HEX5,

	       output [9:0] LEDR
	       );

   wire [3:0] 		    x;
   wire [3:0] 		    y;
   
   assign a1 = SW[8] & SW[7]; //temp to disp sign x
   assign b1 = SW[8] & SW[3]; //temp to disp sign y
   assign LEDR[8] = SW[8];
   assign LEDR[9] = SW[9];
   assign LEDR[7:3] = 5'b00000;

   
   assign x[3] = SW[7];
   assign x[2] = SW[6];
   assign x[1] = SW[5];
   assign x[0] = SW[4];

   assign y[3] = SW[3];
   assign y[2] = SW[2];
   assign y[1] = SW[1];
   assign y[0] = SW[0];


   // Temps
   reg  [3:0] 	    q; //temp to disp x
   reg  [3:0] 	    p; //temp to disp y
	reg signed [3:0] 	    r; //temp to comp x
   reg signed [3:0] 	    s; //temp to comp y
	
	reg [0:0]a; //LED0 - true if equal
	reg [0:0]b; //LED1 - true if x > y
	reg [0:0]c; //LED2 - true if x < y
   
   
   // Numbers to display
   reg [3:0] 	    num1; //holds disp value x
   reg [3:0] 	    num2; //holds disp value y
  
   
	hex_driver H2 (
		  .OFF(1'b1),
		  .HEX(HEX2)
		  );
		  
	hex_driver H3 (
		  .OFF(1'b1),
		  .HEX(HEX3)
		  );
		  
	
   hex_driver H5 (
		  .SIGN(a1),
		  .OFF(~a1),
		  .HEX(HEX5)
		  );
   
   hex_driver H1 (
		  .SIGN(b1),
		  .OFF(~b1),
		  .HEX(HEX1)
		  );

		  
	hex_driver H0 (
		  .NUM(num2),
		  .HEX(HEX0)
		  );
		  
	hex_driver H4 (
		  .NUM(num1),
		  .HEX(HEX4)
		  );
   

   always @(SW[8])
     begin
	if(SW[8]) 
	  begin
	     q = (x);
	     p = (y);
		  r = $signed(x);
	     s = $signed(y);
		   if(x[3]) begin
	      q = ~x + 1;
		  
	      
	   end
	   if(y[3]) begin
	      p = ~y + 1;
	      
	   end
		  
	     num1 = q;
	     num2 = p;
		  
	     a = r < s;
		 b = r > s;
		  c = r == s;
	  end
	else begin
	   
	   
	    num1 = x;
	    num2 = y;
		 a = x < y;
		  b = x > y;
		  c = x == y;
	end
	
     end

  assign LEDR[0] = a;
   assign LEDR[1] = b;
  assign LEDR[2] = c;
   
   

   
endmodule // compare
