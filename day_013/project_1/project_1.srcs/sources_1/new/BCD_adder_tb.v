//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/04/2024 09:08:42 AM
// Module Name: BCD_adder_tb
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps


module BCD_adder_tb;

    reg [3:0] X, Y; // 4-bit inputs
    reg Cin;        // Carry input
    wire [3:0] P; // 4-bit BCD sum
    wire Cout;      // Carry output

    // Instantiate the BCD adder
    BCD_adder UUT (
        .X(X), 
        .Y(Y), 
        .Cin(Cin), 
        .P(P), 
        .Cout(Cout)
    );

    initial begin
        // Test cases
        $monitor("X = %d, Y = %d, Cin = %b -> P = %d, Cout = %b", X, Y, Cin, P, Cout);
        
        // Initial input values
        X = 4'b0000; Y = 4'b0000; Cin = 0;
        #10 X = 4'b0011; Y = 4'b0101; Cin = 0;  // 3 + 5
        #10 X = 4'b1001; Y = 4'b0101; Cin = 0;  // 9 + 5
        #10 X = 4'b0110; Y = 4'b0111; Cin = 0;  // 6 + 7
        #10 X = 4'b1001; Y = 4'b1001; Cin = 1;  // 9 + 9 + Cin
        
        #10 $finish;
    end
endmodule
