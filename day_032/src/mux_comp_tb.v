`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/23/2024 06:19:02 AM
// Module Name: mux_comp_tb
//////////////////////////////////////////////////////////////////////////////////


module mux_comp_tb;
    reg a,b;
    wire lessThan, greaterThan, equalTo;
    mux_comp DUT(a,b,lessThan, greaterThan, equalTo);
        initial begin
            $display("a,  b   lessThan  greaterThan equalTo");
            $monitor("%b, %b  %b        %b          %b",a,b,lessThan, greaterThan, equalTo);
            a=0; b=0; #10;
            a=0; b=1; #10;
            a=1; b=0; #10;
            a=1; b=1; #10;
            
            $finish;
        end
endmodule
