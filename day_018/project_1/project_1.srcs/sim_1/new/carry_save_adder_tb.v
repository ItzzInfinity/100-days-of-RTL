`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/09/2024 10:29:12 AM
// Module Name: carry_save_adder_tb
//////////////////////////////////////////////////////////////////////////////////

module carry_save_adder_tb;
    reg [3:0] a, b, c;
    wire [5:0] sum;
    wire cout;

    carry_save_adder DUT (.a(a), .b(b), .c(c), .sum(sum), .cout(cout));

    initial begin
        $monitor("Time = %0t | a = %d, b = %d, c = %d | sum = %d, cout = %b", $time, a, b, c, sum, cout);
      a = 4'b0001; b = 4'b0010; c = 4'b0100; 
        #10;
        a = 4'b1010; b = 4'b0111; c = 4'b0011;
        #10;
        a = 4'b1111; b = 4'b1111; c = 4'b1111;
        #10;
        a = 4'b0000; b = 4'b0000; c = 4'b0001;
        #10;
        a = 4'b1001; b = 4'b0110; c = 4'b0010;
        #10;
        a = 4'b0000; b = 4'b1111; c = 4'b1111;
        #10;
        a = 4'b1111; b = 4'b0000; c = 4'b1111;
        #10;
        a = 4'b1111; b = 4'b1111; c = 4'b0000;
        #10;
        $finish;
    end
endmodule
