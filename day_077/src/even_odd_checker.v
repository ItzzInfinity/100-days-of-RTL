`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/07/2024 09:14:47 AM
// Module Name: even_odd_checker
//////////////////////////////////////////////////////////////////////////////////

module even_odd_checker (
    input [7:0] number, 
    output reg is_even   // Output: 1 if even, 0 if odd
);

    always @(*) begin
        is_even = ~number[0]; // Check the least significant bit (LSB)
    end

endmodule
