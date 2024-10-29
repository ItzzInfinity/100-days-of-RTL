`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/29/2024 06:51:38 AM
// Module Name: tb_BCD_to_decimal
//////////////////////////////////////////////////////////////////////////////////


module tb_BCD_to_decimal;

    reg [3:0] x;         // Input to the DUT
    wire [9:0] y;        // Output from the DUT

    // Instantiate the BCD_to_decimal module
    BCD_to_decimal uut (.x(x),.y(y));
 initial begin
        
        $monitor("Time = %0t, BCD = %b, Decimal = %b", $time, x, y);
        x = 4'b0000; #10;   // BCD 0
        x = 4'b0001; #10;  // BCD 1
        x = 4'b0010; #10;  // BCD 2
        x = 4'b0011; #10;  // BCD 3
        x = 4'b0100; #10;  // BCD 4
        x = 4'b0101; #10;  // BCD 5
        x = 4'b0110; #10;  // BCD 6
        x = 4'b0111; #10;  // BCD 7
        x = 4'b1000; #10;  // BCD 8
        x = 4'b1001; #10;  // BCD 9
        
        // Test for invalid BCD codes
        x = 4'b1010; #10;  // Invalid BCD
        x = 4'b1100; #10;  // Invalid BCD

        $finish; 
    end

endmodule
