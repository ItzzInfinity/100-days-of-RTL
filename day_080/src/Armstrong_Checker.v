`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/10/2024 05:39:03 AM
// Module Name: Armstrong_Checker
//////////////////////////////////////////////////////////////////////////////////

module Armstrong_Checker(
    input [15:0] num,       
    output reg is_armstrong 
);
    reg [15:0] temp;        
    reg [3:0] digit;        
    reg [31:0] sum;         
    integer i;

    function [31:0] cube;
        input [15:0] x;
        begin
            cube = x * x * x;
        end
    endfunction

    always @(*) begin
        temp = num;
        sum = 0;

        for (i = 0; i < 5; i = i + 1) begin
            digit = temp % 10; 
            sum = sum + cube(digit);
            temp = temp / 10; 
        end

        is_armstrong = (sum == num);
    end
endmodule

