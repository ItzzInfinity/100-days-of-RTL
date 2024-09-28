`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/29/2024 08:30:36 PM
// Module Name: full_adder
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