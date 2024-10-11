`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/12/2024 06:40:15 AM
// Module Name: N_bit_comparator
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module N_bit_comparator(a, b, Lesser, Greater, Equal);
    parameter N = 8;
    input [N-1:0] a, b;
    output reg Lesser, Greater, Equal;
    
    always @(*) begin
        Lesser  = (a < b);
        Greater = (a > b);
        Equal   = (a == b);
    end

endmodule
