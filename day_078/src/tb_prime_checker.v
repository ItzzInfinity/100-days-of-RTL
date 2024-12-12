`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/07/2024 06:24:45 AM
// Module Name: tb_prime_checker
//////////////////////////////////////////////////////////////////////////////////

module tb_prime_checker;

    reg [7:0] number;       
    wire is_prime;          

    prime_checker uut (
        .number(number),
        .is_prime(is_prime)
    );

    initial begin

        $monitor("Time = %0d, Number = %d, Is Prime = %b", $time, number, is_prime);

        // Test cases
        number = 8'd0; #10;  // 0 (Not Prime)
        number = 8'd1; #10;  // 1 (Not Prime)
        number = 8'd2; #10;  // 2 (Prime)
        number = 8'd3; #10;  // 3 (Prime)
        number = 8'd4; #10;  // 4 (Not Prime)
        number = 8'd17; #10; // 17 (Prime)
        number = 8'd20; #10; // 20 (Not Prime)
        number = 8'd23; #10; // 23 (Prime)


        $finish;
    end

endmodule

