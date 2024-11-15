`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/15/2024 10:16:08 AM
// Module Name: SISO
//////////////////////////////////////////////////////////////////////////////////

module SISO(
    input clk, reset, serial_in,
    output serial_out
    );

    wire q2, q1, q0;

    D_flipflop D3 (.d(serial_in), .clk(clk), .reset(reset), .Q(q2));
    D_flipflop D2 (.d(q2), .clk(clk), .reset(reset), .Q(q1));
    D_flipflop D1 (.d(q1), .clk(clk), .reset(reset), .Q(q0));
    D_flipflop D0 (.d(q0), .clk(clk), .reset(reset), .Q(serial_out));
    
endmodule

module D_flipflop(
    input clk, reset, d,
    output reg Q
    );
    
    always @(posedge clk) begin
        if (reset)
            Q <= 1'b0;
        else 
            Q <= d;
    end

endmodule