`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/05/2024 08:34:46 AM
// Module Name: divider_4b_tb
//////////////////////////////////////////////////////////////////////////////////

module divider_4b_tb;

    reg [3:0] dividend;
    reg [3:0] divisor;
    wire [3:0] quotient;
    wire [3:0] remainder;
    
    divider_4b uut (
        .dividend(dividend),.divisor(divisor),.quotient(quotient),.remainder(remainder)
    );
    
    initial begin
        // Test cases
        dividend = 4'd12; divisor = 4'd3; #10;
        
        dividend = 4'd9;divisor = 4'd4; #10;
        
        dividend = 4'd7;divisor = 4'd2; #10;
        
        dividend = 4'd15; divisor = 4'd5; #10;


        $finish;
    end
    
    initial begin
        $monitor("Time = %0t | Dividend = %d | Divisor = %d | Quotient = %d | Remainder = %d",
                 $time, dividend, divisor, quotient, remainder);
    end

endmodule
