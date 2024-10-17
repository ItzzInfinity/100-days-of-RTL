`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/18/2024 08:47:52 AM
//////////////////////////////////////////////////////////////////////////////////


module adder_tb;
  reg a, b, cin;
  wire sum, carry;

  full_adder_by_mux DUT(a, b, cin, sum, carry);

  initial begin

    a = 0; b = 0; cin = 0;
    #10;
    a = 0; b = 0; cin = 1;
    #10;
    a = 0; b = 1; cin = 0;
    #10;
    a = 0; b = 1; cin = 1;
    #10;
    a = 1; b = 0; cin = 0;
    #10;
    a = 1; b = 0; cin = 1;
    #10;
    a = 1; b = 1; cin = 0;
    #10;
    a = 1; b = 1; cin = 1;
    #10;
  end
  
    initial begin
    $monitor("a = %b, b = %b, cin = %b, sum = %b, carry = %b", a, b, cin, sum, carry);
    #80 $finish;
  end
endmodule