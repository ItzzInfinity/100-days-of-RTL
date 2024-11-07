`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/07/2024 07:51:48 AM
// Module Name: jk_tb
//////////////////////////////////////////////////////////////////////////////////


module jk_tb;
reg clk,rst,j,k;
wire Q;

  jk_ff dut(j,k,clk,rst,Q);
  
  initial begin 
  clk=0;
  forever #5 clk=~clk;
  end
  
  initial 
    begin
     rst=1; #10;
     
     j = 1'b0; k = 1'b0; #10;
     
     rst=0; #10;
     
     j = 1'b0; k = 1'b1; #10;
     
     j = 1'b1; k = 1'b0; #10;
     
     j = 1'b1; k = 1'b1; #10;
    end
    initial begin
    $monitor("\t clk: %d  J: %d  K: %d  Q: %d", clk, j, k, Q);
    #80 $finish;
    end 

endmodule
