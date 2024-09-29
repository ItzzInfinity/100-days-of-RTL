`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/30/2024 09:14:36 PM 
// Module Name: parallel_adder_subtractor_16b
//////////////////////////////////////////////////////////////////////////////////


module parallel_adder_subtractor_16b(
    input selAddSub,              // 0 for addition, 1 for subtraction
    input [15:0] x, y,            // 16-bit inputs
    output [15:0] s,              // 16-bit sum/difference
    output cout,                   // Carry-out/borrow-out from the most significant bit
    input Cin
);

    wire [2:0] c;                 // Carry/borrow between the 4-bit adders

    parallel_adder_4b U0 (
        .selAddSub(selAddSub),.x(x[3:0]),.y(y[3:0]),.s(s[3:0]),.cout(c[0]),.cin(Cin)
    );

    parallel_adder_4b U1 (
        .selAddSub(selAddSub), 
        .x(x[7:4]), .y(y[7:4]),.s(s[7:4]),.cout(c[1]),.cin(c[0])  
    );

    parallel_adder_4b U2 (
        .selAddSub(selAddSub),.x(x[11:8]),.y(y[11:8]),.s(s[11:8]),.cout(c[2]),.cin(c[1]) 
    );

    parallel_adder_4b U3 (
        .selAddSub(selAddSub), .x(x[15:12]),.y(y[15:12]),.s(s[15:12]),.cout(cout),.cin(c[2]) 
    );

endmodule

