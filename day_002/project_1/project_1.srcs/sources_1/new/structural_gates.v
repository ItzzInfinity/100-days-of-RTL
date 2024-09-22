`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Create Date: 09/23/2024 09:59:32 PM
// Module Name: structural_gates
//////////////////////////////////////////////////////////////////////////////////


module structural_gates(
    input a,
    input b,
    output out_and,out_or,out_nand,out_nor,out_xor,out_xnor
    );
    assign out_and = a&b;
    assign out_or = a|b;
    assign out_nand = ~(a&b);
    assign out_nor = ~(a|b);
    assign out_xor = a^b;
    assign out_xnor = ~(a^b);
endmodule
