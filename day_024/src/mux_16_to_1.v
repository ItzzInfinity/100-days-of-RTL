`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/15/2024 08:26:12 AM
// Module Name: mux_16_to_1
//////////////////////////////////////////////////////////////////////////////////

module mux_16_to_1(
   input [15:0] a,
   input [3:0] sel,
   output y);

    wire [7:0] w;
    //level 1
    mux_2_to_1 mux_1(a[0],a[1],sel[0],w[0]);
    mux_2_to_1 mux_2(a[2],a[3],sel[0],w[1]);
    mux_2_to_1 mux_3(a[4],a[5],sel[0],w[2]);
    mux_2_to_1 mux_4(a[6],a[7],sel[0],w[3]);
    mux_2_to_1 mux_5(a[8],a[9],sel[0],w[4]);
    mux_2_to_1 mux_6(a[10],a[11],sel[0],w[5]);
    mux_2_to_1 mux_7(a[12],a[13],sel[0],w[6]);
    mux_2_to_1 mux_8(a[14],a[15],sel[0],w[7]);
    
    //level 2
    wire [3:0] x;
    mux_2_to_1 mux_9(w[0],w[1],sel[1],x[0]);
    mux_2_to_1 mux_10(w[2],w[3],sel[1],x[1]);
    mux_2_to_1 mux_11(w[4],w[5],sel[1],x[2]);
    mux_2_to_1 mux_12(w[6],w[7],sel[1],x[3]);
        
    //level 3
    wire [1:0] z;
    mux_2_to_1 mux_13(x[0],x[1],sel[2],z[0]);
    mux_2_to_1 mux_14(x[2],x[3],sel[2],z[1]);
        
    //level 4
    mux_2_to_1 mux_15(z[0],z[1],sel[3],y);
endmodule
