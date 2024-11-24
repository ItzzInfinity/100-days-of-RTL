`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/24/2024 05:19:14 AM
// Module Name: adder_6bit
//////////////////////////////////////////////////////////////////////////////////

module adder_6bit(
		input [5:0] x,y,
		output [5:0] z
		);
    assign z=x+y;
endmodule