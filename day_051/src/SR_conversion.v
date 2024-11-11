`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/11/2024 07:00:21 AM
// Module Name: SR_conversion
//////////////////////////////////////////////////////////////////////////////////


module SR_conversion (
    input J, K, D, T, clk, reset,
    output q_jk, q_d, q_t
);
    
    JK_flipflop jk_ff (.J(J),.K(K),.clk(clk),.reset(reset),.Q(q_jk));

    
    D_flipflop d_ff (.D(D),.clk(clk),.reset(reset),.Q(q_d));

    
    T_flipflop t_ff (.T(T),.clk(clk),.reset(reset),.Q(q_t));

endmodule

