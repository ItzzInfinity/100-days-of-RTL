`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/08/2024 06:45:52 AM
// Module Name: Dff_tb
//////////////////////////////////////////////////////////////////////////////////


module Dff_tb;
reg clk,rst,d;
wire Q;

  D_flipflop DUT(clk,rst,d,Q);
  
  initial begin 
  clk=0;
  d=0;
  forever #4 clk=~clk;
  end
  
  initial 
    begin
     rst=1;
     #10;  
     rst=0;
    forever #10 d= ~d;
    end 
    
    initial begin
    $monitor("\t clk: %d  D: %d  Q: %d", clk, d, Q);
    #80 $finish;
    end
endmodule
