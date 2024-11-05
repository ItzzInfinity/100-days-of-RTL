`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/05/2024 05:54:37 AM
// Module Name: BCD_to_7_seg
//////////////////////////////////////////////////////////////////////////////////

module BCD_to_7_seg(
input a,b,c,d,
output [6:0]S);
assign S[0] = a|c|(~(b^d));
assign S[1] = ~b|~(c^d);
assign S[2] = b|(~c)|d;
assign S[3] = a|(c&~d)|b^(c|~d);
assign S[4] = ~d&(~b|c);
assign S[5] = a|~(c&d)|b&(~c|~d);
assign S[6] = a|(c&~d)|(b^c); 
endmodule
