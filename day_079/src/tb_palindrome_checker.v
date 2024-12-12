`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/09/2024 07:07:06 AM
// Module Name: tb_palindrome_checker
//////////////////////////////////////////////////////////////////////////////////

module tb_palindrome_checker;

    reg [7:0] number;         
    wire is_palindrome;        
    
    palindrome_checker DUT (
        .number(number),
        .is_palindrome(is_palindrome)
    );

    initial begin
        
        $display("Time\tNumber\tIs_Palindrome");
        
        number = 8'b01111011; #10; // Decimal 123 is not a palindrome
        $display("%0t\t%d\t\t%b", $time, number, is_palindrome);

        number = 8'b00011011; #10; // Decimal 27 is not a palindrome
        $display("%0t\t%d\t\t%b", $time, number, is_palindrome);

        number = 8'b01111001; #10; // Decimal 121 is a palindrome
        $display("%0t\t%d\t\t%b", $time, number, is_palindrome);
        $finish;
  end

endmodule

