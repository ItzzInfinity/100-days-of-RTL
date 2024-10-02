`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/03/2024 10:09:17 PM
// Module Name: top_module
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    input a, b, cin, bin,
    output sum_half, carry_half, sum_full, carry_full,
    output diff_half, borrow_half, diff_full, borrow_full
);
    half_adder_nand ha_inst (
        .a(a), .b(b), 
        .sum(sum_half), 
        .carry(carry_half)
    );
    
    full_adder_nand fa_inst (
        .a(a), .b(b), .cin(cin), 
        .sum(sum_full), 
        .carry(carry_full)
    );
    
    half_subtractor_nand hs_inst (
        .a(a), .b(b), 
        .diff(diff_half), 
        .borrow(borrow_half)
    );
    
    full_subtractor_nand fs_inst (
        .a(a), .b(b), .bin(bin), 
        .diff(diff_full), 
        .borrow(borrow_full)
    );
endmodule
