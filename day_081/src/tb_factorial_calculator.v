`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/11/2024 11:19:00 AM
// Module Name: tb_factorial_calculator
//////////////////////////////////////////////////////////////////////////////////

module tb_factorial_calculator;
    reg [4:0] num;        
    reg clk, reset, start; 
    wire [31:0] factorial; 
    wire done;             
    factorial_calculator DUT (
        .num(num),.clk(clk),.reset(reset),
        .start(start),.factorial(factorial),.done(done));

    always #5 clk = ~clk; 

    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        num = 0;
        #10 reset = 0;
        
        #10 num = 5;
        start = 1;
        #10 start = 0; 
        #100; 
        $display("Factorial of %0d is %0d (done=%0d)", num, factorial, done);
        
        #20 reset = 1; #10 reset = 0; 
        num = 4;
        start = 1;
        #10 start = 0;
        #100; 
        $display("Factorial of %0d is %0d (done=%0d)", num, factorial, done);

        #20 reset = 1; #10 reset = 0; 
        num = 3;
        start = 1;
        #10 start = 0;
        #100;
        $display("Factorial of %0d is %0d (done=%0d)", num, factorial, done);

        #20 $finish;
    end
endmodule



