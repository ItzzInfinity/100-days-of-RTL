`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/13/2024 05:49:10 AM
// Module Name: D_flipflop
//////////////////////////////////////////////////////////////////////////////////

module D_flipflop (
    input clk, reset, d,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= d;
    end
endmodule
