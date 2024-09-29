`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/30/2024 09:14:36 PM 
// Module Name: parallel_adder_subtractor_16b
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