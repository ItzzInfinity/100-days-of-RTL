`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/10/2024 05:46:32 AM
// Module Name: tb_Armstrong_Checker
//////////////////////////////////////////////////////////////////////////////////

module tb_Armstrong_Checker;
    reg [15:0] num;         
    wire is_armstrong;      

 
    Armstrong_Checker DUT (
        .num(num),
        .is_armstrong(is_armstrong)
    );

    initial begin
        $monitor("Time=%0t, num=%d, is_armstrong=%b", $time, num, is_armstrong);

        
        num = 16'd153; #10;   // (1^3 + 5^3 + 3^3 = 153)
        num = 16'd370; #10;   // (3^3 + 7^3 + 0^3 = 370)
        num = 16'd371; #10;   // (3^3 + 7^3 + 1^3 = 371)
        num = 16'd407; #10;   // (4^3 + 0^3 + 7^3 = 407)
        num = 16'd123; #10;   // Not an Armstrong number
        num = 16'd9474; #10;  // (9^3 + 4^3 + 7^3 + 4^3 = 9474)
        num = 16'd9475; #10;  // Not an Armstrong number
        num = 16'd0;    #10;  
        $stop;
    end
endmodule
