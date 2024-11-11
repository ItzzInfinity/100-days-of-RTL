`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/11/2024 06:17:07 AM
// Module Name: SR_flipflop
//////////////////////////////////////////////////////////////////////////////////


module SR_flipflop (
    input S, R, clk, reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if (S && !R)
            Q <= 1'b1;
        else if (!S && R)
            Q <= 1'b0;
    end
endmodule

