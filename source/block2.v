
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module block2(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


wire [8:0] addW;
wire[3:0] n2 = SW[3:0];
reg[3:0] temp;
   
   assign LEDR[7:0] = 8'b00000000;
	assign LEDR[8] = SW[8];
   

//=======================================================
//  Structural coding
//=======================================================

   

	
	slide_in SL(
	       .SW (SW),
	       .MODE(1'b1),
	       .HEX2 (HEX2),
	       .HEX3 (HEX3),
	       .HEX4 (HEX4),
	       .HEX5 (HEX5)
//			 .HEX0(HEX0),
//			 .HEX1(HEX1)
	       );
			 
			
			
//			if(addW > 7 && addW < -8)begin
//				assign overflow = 1;
//			end
//			else begin
//				assign overflow = 0;
//			end
////			assign overflow = !(((addW^n1) & (addW^n2)) >> 4);
	
	always @ (KEY[0]) 
	begin
		if(~KEY[0])
			temp = ~n2+1;
		else
			temp = n2;
			
	end
	rippleCarryAdder add(0,SW[7:4],temp,addW[3:0],addW[8]);
	hex_driver_of H0 (
	  .NUM(addW[3:0]), .HEX(HEX0), .of(addW[8])
	  );
	 hex_driver_of H1 (
	  .SIGN(addW[3]), 
	  .OFF(~addW[3]),
	  .of(addW[8]),
	  .HEX(HEX1)
	  );
	
		

endmodule
