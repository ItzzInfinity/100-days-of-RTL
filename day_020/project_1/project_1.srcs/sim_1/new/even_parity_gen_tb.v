`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/11/2024 11:07:15 AM
// Module Name: even_parity_gen_tb
//////////////////////////////////////////////////////////////////////////////////


module even_parity_gen_tb;
  reg [7:0]a;
  wire p_even;
  wire [8:0] b;

  even_parity_gen DUT(a,p_even,b);
    initial begin
        repeat(10) begin
        a = $random(); #10;
        $monitor("For digit %d (%b) the parity bit is --> %b",a,a,p_even);
        end
        $finish;
    end
endmodule
