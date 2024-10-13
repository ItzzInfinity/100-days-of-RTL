`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/14/2024 06:16:57 AM
// Module Name: mux_4to1
//////////////////////////////////////////////////////////////////////////////////


module mux_4to1(
input [3:0] a,b,c,d,
input [1:0] sel,
output [3:0] y
    );
    wire [3:0] y1,y2;
    mux_2_to_1 mux_1(a,b,sel[0],y1);
    mux_2_to_1 mux_2(c,d,sel[0],y2);
    mux_2_to_1 mux_3(y1,y2,sel[1],y);
    
    
endmodule
