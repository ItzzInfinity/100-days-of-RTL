`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/13/2024 06:16:57 AM
// Module Name: mux_2_to_1
//////////////////////////////////////////////////////////////////////////////////


module mux_2_to_1(
input [3:0] a,b,
input sel,
output [3:0] y);

assign y = (~sel)?a:b;


endmodule

