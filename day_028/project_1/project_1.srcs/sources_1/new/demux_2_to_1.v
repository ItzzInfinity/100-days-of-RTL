`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/19/2024 05:52:38 AM
// Module Name: demux_2_to_1
//////////////////////////////////////////////////////////////////////////////////


module demux_2_to_1(
input [3:0] a,
input sel,
output [3:0] y1,y2
  );
//  assign y1 = a &  sel;
//  assign y2 = a & ~sel;
 assign {y1,y2} = sel?{4'b0,a}: {a,4'b0};
endmodule
