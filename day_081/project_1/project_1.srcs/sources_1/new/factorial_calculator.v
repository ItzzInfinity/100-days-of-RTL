`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/11/2024 11:17:26 AM
// Module Name: factorial_calculator
//////////////////////////////////////////////////////////////////////////////////

module factorial_calculator (
    input [4:0] num,          
    input clk, reset, start,  
    output reg [31:0] factorial, 
    output reg done           
);
    reg [4:0] count; 
    reg calculating; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            factorial <= 1;   
            count <= 0;       
            done <= 0;        
            calculating <= 0; 
        end else if (start && !calculating) begin
            factorial <= 1;  
            count <= num;    
            done <= 0;       
            calculating <= 1;
        end else if (calculating) begin
            if (count > 0) begin
                factorial <= factorial * count; 
                count <= count - 1;            
            end else begin
                calculating <= 0; 
                done <= 1;        
            end
        end
    end
endmodule
