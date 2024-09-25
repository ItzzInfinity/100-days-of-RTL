`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:Anjan Prasad 
// Create Date: 09/26/2024 08:21:52 PM
// Module Name: random_expression
//////////////////////////////////////////////////////////////////////////////////


module random_expression(
    input A,
    input B,
    input C,
    input D,
    output Y
    );
    
    assign Y = (~A & B) | (C & ~D) | (A & ~B & D);
endmodule
