`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/24/2024 05:19:14 AM
// Module Name: adder_4bit
//////////////////////////////////////////////////////////////////////////////////

module adder_4bit(
		input [3:0] x,y,
		output [3:0] z
		);
    assign z=x+y;
endmodule
