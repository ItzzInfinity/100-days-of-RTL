`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/07/2024 06:23:14 AM
// Module Name: prime_checker
//////////////////////////////////////////////////////////////////////////////////

module prime_checker (
    input [7:0] number, 
    output reg is_prime 
);

    integer i; 
    reg is_not_prime; 

    always @(*) begin
        if (number < 2) 
            is_prime = 0; 
        else begin
            is_not_prime = 0; 
            for (i = 2; i <= number / 2; i = i + 1) begin
                if (number % i == 0) 
                    is_not_prime = 1; 
            end
            is_prime = ~is_not_prime; 
        end
    end

endmodule

