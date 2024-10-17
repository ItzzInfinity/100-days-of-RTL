`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/18/2024 08:38:25 AM
// Module Name: full_adder_by_mux
//////////////////////////////////////////////////////////////////////////////////


module full_adder_by_mux(
    input a,b,cin,
    output sum, carry
    );
    wire [4:0]w;
    
    mux_2_to_1 not1(1'b1, 1'b0, a, w[0]);
    mux_2_to_1 M1(a, w[0], b, w[1]);
    mux_2_to_1 not2(1'b1, 1'b0, w[1], w[2]);
    mux_2_to_1 M2(w[1], w[2], cin, sum);
    
    mux_2_to_1 And_1(1'b0, w[1], cin, w[3]);
    mux_2_to_1 And_2(1'b0, a, b, w[4]);
    mux_2_to_1 M3(w[3], w[4], w[4], carry);
        
endmodule