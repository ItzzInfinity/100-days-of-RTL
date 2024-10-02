`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/02/2024 10:55:23 PM
// Module Name: top_module_tb
//////////////////////////////////////////////////////////////////////////////////

module top_module_tb;
    reg a, b, cin, bin;
    wire sum_half, carry_half;
    wire sum_full, carry_full;
    wire diff_half, borrow_half;
    wire diff_full, borrow_full;

    top_module DUT (
        .a(a), .b(b), .cin(cin), .bin(bin),.sum_half(sum_half),.carry_half(carry_half),.sum_full(sum_full),.carry_full(carry_full),.diff_half(diff_half),
        .borrow_half(borrow_half),.diff_full(diff_full),.borrow_full(borrow_full)
    );
    initial begin
     $monitor("a=%b, b=%b, cin=%b, bin=%b | sum_half=%b, carry_half=%b, sum_full=%b, carry_full=%b, diff_half=%b, borrow_half=%b, diff_full=%b, borrow_full=%b", 
                  a, b, cin, bin, sum_half, carry_half, sum_full, carry_full, diff_half, borrow_half, diff_full, borrow_full);
        a = 0; b = 0; cin = 0; bin = 0;
        #10;
        a = 0; b = 1; cin = 0; bin = 0;
        #10;
        a = 1; b = 0; cin = 0; bin = 1;
        #10;
        a = 1; b = 1; cin = 1; bin = 1;
        #10;
        a = 0; b = 1; cin = 1; bin = 0;
        #10;
        a = 1; b = 0; cin = 1; bin = 0;
        #10;
        a = 1; b = 1; cin = 1; bin = 1;
        #10;
        $finish;
    end

endmodule
