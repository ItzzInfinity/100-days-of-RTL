`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/14/2024 04:09:24 AM
// Module Name: T_flipflop
//////////////////////////////////////////////////////////////////////////////////

module T_flipflop (
    input T, clk, reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end
endmodule

