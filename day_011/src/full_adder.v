`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/02/2024 11:10:41 AM
// Module Name: multiplier
//////////////////////////////////////////////////////////////////////////////////

module full_adder (
input a,
input b,
input cin,
output sum,
output cout);
assign sum = (a^b^cin);
assign cout = (a&&b)||(b&&cin)||(a&&cin);
endmodule
