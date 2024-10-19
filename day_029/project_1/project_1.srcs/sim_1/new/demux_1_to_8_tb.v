`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/06/2024 08:31:43 AM
// Module Name: demux_1_to_8_tb
//////////////////////////////////////////////////////////////////////////////////


module demux_1_to_8_tb;
 reg a;
 reg [2:0] sel;
 wire [7:0] y;
    
    demux_1_to_8 DUT (a,sel,y);
    
    initial begin
  a = 0; sel = 3'b000 ; #10; 
  
  a = 1; sel = 3'b000 ; #10; 
  a = 1; sel = 3'b001 ; #10; 
  a = 1; sel = 3'b010 ; #10; 
  a = 1; sel = 3'b011 ; #10; 
  a = 1; sel = 3'b100 ; #10; 
  a = 1; sel = 3'b101 ; #10; 
  a = 1; sel = 3'b110 ; #10; 
  a = 1; sel = 3'b111 ; #10; 
  
  
    $finish;
    
    
    end
    

endmodule
