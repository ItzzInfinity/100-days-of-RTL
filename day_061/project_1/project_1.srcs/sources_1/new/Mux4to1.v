`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/21/2024 08:58:36 AM
// Module Name: Mux4to1
//////////////////////////////////////////////////////////////////////////////////


module Mux4to1 (
    input wire in0, in1, in2, in3,
    input wire [1:0] sel,
    output reg out
);
    always @(*) begin
        case (sel)
            2'b00: out = in0; // Hold
            2'b01: out = in1; // Shift Right
            2'b10: out = in2; // Shift Left
            2'b11: out = in3; // Parallel Load
            default: out = in0;
        endcase
    end
endmodule

