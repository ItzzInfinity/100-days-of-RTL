`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/12/2024 11:05:13 AM
// Module Name: JK_flipflop
//////////////////////////////////////////////////////////////////////////////////


module JK_flipflop (
    input J, K, clk, reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;      // Hold state
                2'b01: Q <= 0;      // Reset
                2'b10: Q <= 1;      // Set
                2'b11: Q <= ~Q;     // Toggle
            endcase
        end
    end
endmodule
