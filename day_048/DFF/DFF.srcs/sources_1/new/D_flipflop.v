`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/08/2024 06:44:52 AM
// Module Name: D_flipflop
//////////////////////////////////////////////////////////////////////////////////

module D_flipflop(
    input clk, reset, d,
    output reg Q
    );
    
    always@(posedge clk)
          begin
            if({reset})
                Q<= 1'b0;
            else 
                Q <= d;
            end

endmodule