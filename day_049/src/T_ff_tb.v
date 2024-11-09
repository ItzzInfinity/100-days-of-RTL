`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/09/2024 06:56:43 AM
// Module Name: T_ff_tb
//////////////////////////////////////////////////////////////////////////////////


module T_ff_tb;
reg clk,rst,t;
wire q;
  T_ff DUT(t,clk,rst,q);
  
  initial 
  begin 
       clk=0;
       t=0;
       forever #4 clk=~clk;
  end
    
  initial 
      begin
          rst=1;
          #10;
          rst=0;
          forever
          begin   
          #10 t = 1'b1;
          #20  t = 1'b0; 
          end
      end
    initial begin
    $monitor("\t clock: %b  T: %b  Q: %b",clk,t,q);
    #100$finish;
    end
endmodule
