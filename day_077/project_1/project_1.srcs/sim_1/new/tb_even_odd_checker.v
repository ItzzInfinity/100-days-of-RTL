`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/07/2024 09:17:31 AM
// Module Name: tb_even_odd_checker
//////////////////////////////////////////////////////////////////////////////////

module tb_even_odd_checker;

    reg [7:0] number;       
    wire is_even;           

    even_odd_checker DUT (
        .number(number),
        .is_even(is_even)
    );

    initial begin
        
        $monitor("Time = %0d, Number = %d, Is Even = %b", $time, number, is_even);

        // Test cases
        number = 8'd0; #10;  // Test for 0 (Even)
        number = 8'd1; #10;  // Test for 1 (Odd)
        number = 8'd2; #10;  // Test for 2 (Even)
        number = 8'd255; #10; // Test for 255 (Odd)
        number = 8'd128; #10; // Test for 128 (Even)
        number = 8'd15; #10;  // Test for 15 (Odd)
        $finish;
    end

endmodule
