module hex_mux ( input [7:0] a,                 // block 1
                       input [7:0] b,                 // block 2
                       input [7:0] c,                 // block 3
                       input [1:0] sel,               
                       output reg [7:0] out);         
 always @ (a or b or c or sel) begin
      casex (sel)
         2'b00 : out <= a;
         2'b01 : out <= b;
         2'b1x : out <= c;
      endcase
   end
endmodule
