`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/09/2024 07:04:44 AM
// Module Name: palindrome_checker
//////////////////////////////////////////////////////////////////////////////////

module palindrome_checker (
    input [7:0] number,        
    output reg is_palindrome   // Output: 1 if palindrome, 0 otherwise
);

    reg [7:0] reversed_number; 
    reg [7:0] temp;            
    reg [3:0] i;               
    integer digit;

    always @(*) begin
        reversed_number = 0;
        temp = number;

        for (i = 0; i < 4; i = i + 1) begin
            if (temp > 0) begin
                digit = temp % 10;                       
                reversed_number = (reversed_number * 10) + digit; 
                temp = temp / 10;                 
            end
        end

        // Check if the number is equal to its reversed version
        if (number == reversed_number)
            is_palindrome = 1;
        else
            is_palindrome = 0;
    end
endmodule
