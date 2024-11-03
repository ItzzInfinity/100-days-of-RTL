`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/03/2024 04:44:46 AM
// Module Name: Grey_to_Bin
//////////////////////////////////////////////////////////////////////////////////

/* grey to binary converters */
module Grey_to_Bin(
output [3:0] b,
input[3:0]g);
assign b[0] = g[0] ^ b[1];
assign b[1] = g[1] ^ b[2];
assign b[2] = g[2] ^ b[3];
assign b[3] = g[3];
endmodule
