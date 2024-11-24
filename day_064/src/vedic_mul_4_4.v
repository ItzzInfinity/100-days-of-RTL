`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/24/2024 05:19:14 AM
// Module Name: vedic_mul_4_4
//////////////////////////////////////////////////////////////////////////////////

module vedic_mul_4_4(
	input [3:0] a,b,
	output [7:0] out
    );
    
    wire [3:0] w3,w2,w1,w0,w;
    wire [5:0] w4;
	 
    vedic_mul_2_2 m1(b[3:2],a[3:2],w3[3:0]);
    vedic_mul_2_2 m2(b[3:2],a[1:0],w2[3:0]);
    vedic_mul_2_2 m3(b[1:0],a[3:2],w1[3:0]);
    vedic_mul_2_2 m4(b[1:0],a[1:0],w0[3:0]);
    
    adder_6bit m5({w3[3:0],2'b00},{2'b00,w2[3:0]},w4);
    
    adder_4bit m6(w1[3:0],{2'b00,w0[3:2]},w);
    
    adder_6bit m7(w4,{2'b00,w[3:0]},out[7:2]);
    
    assign out[1:0]=w0[1:0];
    
endmodule
