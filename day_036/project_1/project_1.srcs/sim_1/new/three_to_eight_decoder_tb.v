`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/27/2024 07:28:24 AM
// Module Name: three_to_eight_decoder_tb
//////////////////////////////////////////////////////////////////////////////////

module three_to_eight_decoder_tb;
    reg [1:0]s;
    reg en;
    wire [7:0]y;
    
    three_to_eight_decoder DUT (s,en,y);

      initial begin 
        $monitor("s = %b, so at the output y0 = %b,y1 = %b,y2 = %b,y3 = %b,y4 = %b,y5 = %b,y6 = %b,y7 = %b ",s,y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7]);
        
        {en,s} = 3'b000; #10;
        {en,s} = 3'b001; #10;
        {en,s} = 3'b010; #10;
        {en,s} = 3'b011; #10;
        {en,s} = 3'b100; #10;
        {en,s} = 3'b101; #10;
        {en,s} = 3'b110; #10;
        {en,s} = 3'b111; #10;
        
        $finish;
      end

endmodule