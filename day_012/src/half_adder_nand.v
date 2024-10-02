`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/02/2024 10:07:44 PM
// Module Name: half_adder_nand
//////////////////////////////////////////////////////////////////////////////////


module half_adder_nand(
    input a,
    input b,
    output sum,
    output carry
);
    wire nand1, nand2, nand3, nand4;

    
    nand(nand1, a, b);
    nand(nand2, a, nand1);
    nand(nand3, b, nand1);
    nand(sum, nand2, nand3);

    nand(carry, nand1, nand1);
endmodule
