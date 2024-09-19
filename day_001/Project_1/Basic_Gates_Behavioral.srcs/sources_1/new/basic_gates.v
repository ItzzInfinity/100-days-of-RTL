`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/22/2024 08:57:06 PM
// Module Name: basic_gates
// Project Name: 100DaysofRTL 
//////////////////////////////////////////////////////////////////////////////////

module basic_gates(
input a,b,
output reg out_and, out_or, out_nand, out_nor, out_xor, out_xnor);

always @(*) begin 
    out_and = a&b;
    out_or = a|b;
    out_nand =  ~(a&b);
    out_nor = ~(a|b);
    out_xor = a^b;
    out_xnor = ~(a^b);
end
endmodule
