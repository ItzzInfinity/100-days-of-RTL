`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/22/2024 06:32:58 PM
// Module Name: demux_gates_tb
//////////////////////////////////////////////////////////////////////////////////


module demux_gates_tb;

    reg a,b;
    wire and_g,or_g,nand_g,nor_g;
    demux_to_gates DUT (a,b, and_g,or_g,nand_g,nor_g);
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
