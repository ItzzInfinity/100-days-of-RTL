`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/26/2024 06:41:24 AM
// Module Name: three_to_eight_decoder
//////////////////////////////////////////////////////////////////////////////////

module three_to_eight_decoder(
input [2:0]s,
output y0,y1,y2,y3,y4,y5,y6,y7);
assign y0 = ~s[2]&~s[1]&~s[0];
assign y1 = ~s[2]&~s[1]&s[0];
assign y2 = ~s[2]&s[1]&~s[0];
assign y3 = ~s[2]&s[1]&s[0];
assign y4 = s[2]&~s[1]&~s[0];
assign y5 = s[2]&~s[1]&s[0];
assign y6 = s[2]&s[1]&~s[0];
assign y7 = s[2]&s[1]&s[0];
endmodule