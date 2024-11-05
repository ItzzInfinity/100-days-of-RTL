`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/05/2024 06:01:21 AM
// Module Name: BCD_to_7_seg_tb
//////////////////////////////////////////////////////////////////////////////////


module BCD_to_7_seg_tb;
reg a,b,c,d;
wire [6:0]S;


BCD_to_7_seg DUT (a,b,c,d,S);

initial begin 
    {a,b,c,d}=4'd0;
    #10  {a,b,c,d}=4'd1;
    #10  {a,b,c,d}=4'd2;
    #10  {a,b,c,d}=4'd3;
    #10  {a,b,c,d}=4'd4;
    #10  {a,b,c,d}=4'd5;
    #10  {a,b,c,d}=4'd6;
    #10  {a,b,c,d}=4'd7;
    #10  {a,b,c,d}=4'd8;
    #10  {a,b,c,d}=4'd9;
    #10  $finish;

end

endmodule
