`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/25/2024 08:30:40 AM
// Module Name: mod_n_counter
//////////////////////////////////////////////////////////////////////////////////

module mod_n_counter #(parameter n = 10)(
    input clk,          // Clock signal
    input reset,        // Active high reset
    output reg [$clog2(n)-1:0] q // Dynamically calculate bit-width
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;                  // Reset counter to 0
        else if (q == n-1) 
            q <= 0;                  // Reset to 0 after reaching n-1
        else 
            q <= q + 1;              // Increment counter
    end

endmodule


