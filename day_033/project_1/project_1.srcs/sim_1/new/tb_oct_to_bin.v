`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/24/2024 07:25:10 AM
// Module Name: tb_oct_to_bin
//////////////////////////////////////////////////////////////////////////////////

module tb_oct_to_bin;

  reg [7:0] d;
  wire [2:0] y;
  
  oct_to_bin DUT (.d(d),.y(y));

  initial begin
 
    $monitor("Time = %0t | d = %b | y = %b", $time, d, y);
   
    d = 8'b00000001; #10; // Octal 0 -> Binary 000
    d = 8'b00000010; #10; // Octal 1 -> Binary 001
    d = 8'b00000100; #10; // Octal 2 -> Binary 010
    d = 8'b00001000; #10; // Octal 3 -> Binary 011
    d = 8'b00010000; #10; // Octal 4 -> Binary 100
    d = 8'b00100000; #10; // Octal 5 -> Binary 101
    d = 8'b01000000; #10; // Octal 6 -> Binary 110
    d = 8'b10000000; #10; // Octal 7 -> Binary 111
    
    $stop;
  end
  
endmodule

