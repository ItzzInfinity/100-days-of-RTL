`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/13/2024 06:06:15 AM
// Module Name: mux_gate_tb
//////////////////////////////////////////////////////////////////////////////////


module mux_gate_tb;

    reg a,b;
    wire out_and, out_or, out_nand, out_nor, out_xor, out_xnor,out_not;
    mux_to_gates DUT (a,b, out_and, out_or, out_nand, out_nor, out_xor, out_xnor,out_not);
 initial begin
  a = 1'b0; b = 1'b0;
 #10; 
 a = 1'b0; b = 1'b1;
 #10;
 a = 1'b1; b = 1'b0;
 #10; 
 a = 1'b1; b = 1'b1;
 #10;
 $finish;
end 
endmodule
