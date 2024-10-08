`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/27/2024 08:41:55 PM
// Module Name: half_adder
//////////////////////////////////////////////////////////////////////////////////


module half_adder ( 
    input a, 
    input b, 
    output sum,
	 output carry);
	assign carry = a & b;
	assign sum = (a ^ b);
endmodule
