`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/26/2024 06:43:54 AM
// Module Name: three_to_eight_decoder_tb
//////////////////////////////////////////////////////////////////////////////////


module three_to_eight_decoder_tb;
    reg [2:0]s;
    wire y0,y1,y2,y3,y4,y5,y6,y7;
    
    three_to_eight_decoder DUT (s,y0,y1,y2,y3,y4,y5,y6,y7);

      initial begin 
        $monitor("s = %b, so at the output y0 = %b,y1 = %b,y2 = %b,y3 = %b,y4 = %b,y5 = %b,y6 = %b,y7 = %b ",s,y0,y1,y2,y3,y4,y5,y6,y7);
        
        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;
        
        $finish;
      end

endmodule
