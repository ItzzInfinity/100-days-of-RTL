`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/29/2024 06:40:20 AM
// Module Name: BCD_to_decimal
//////////////////////////////////////////////////////////////////////////////////


module BCD_to_decimal(
input [0:3] x,
output [9:0] y
    );
    assign y[0] = ~x[0] & ~x[1] & ~x[2] & ~x[3];
    assign y[1] = ~x[0] & ~x[1] & ~x[2] &  x[3];
    assign y[2] = ~x[0] & ~x[1] &  x[2] & ~x[3];
    assign y[3] = ~x[0] & ~x[1] &  x[2] &  x[3];
    assign y[4] = ~x[0] &  x[1] & ~x[2] & ~x[3];
    assign y[5] = ~x[0] &  x[1] & ~x[2] &  x[3];
    assign y[6] = ~x[0] &  x[1] &  x[2] & ~x[3];
    assign y[7] = ~x[0] &  x[1] &  x[2] &  x[3];
    assign y[8] =  x[0] & ~x[1] & ~x[2] & ~x[3];
    assign y[9] =  x[0] & ~x[1] & ~x[2] &  x[3];
    
endmodule
