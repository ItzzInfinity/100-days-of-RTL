`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/24/2024 10:42:52 PM
// Module Name: gate_level
//////////////////////////////////////////////////////////////////////////////////


module gate_level(
    input i1,i2,ctrl,
    output o_and,o_or,o_nand,o_nor,o_xnor,o_xor,buf_0,buf_1
);

    and and_1 (o_and,i1,i2);
    or or_1 (o_or,i1,i2);
    nand nand_1 (o_nand,i1,i2);
    nor nor_1 (o_nor,i1,i2);
    xnor xnor_1 (o_xnor,i1,i2);
    xor xor_1 (o_xor,i1,i2);
    bufif0 buf_o (buf_0,i1,ctrl);
    bufif1 buf_n (buf_1,i1,crtl);
endmodule