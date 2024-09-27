`timescale 10ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/28/2024 10:15:06 PM
// Module Name: half_subtractor
//////////////////////////////////////////////////////////////////////////////////

module hs_tb;
 reg X,Y;
 wire D,Bout;
 half_subtractor DUT(X,Y,D,Bout);
 
 initial begin
 #10 X = 0; Y = 0;
 #10 X = 0; Y = 1;
 #10 X = 1; Y = 0;
 #10 X = 1; Y = 1;
 end
 
endmodule
