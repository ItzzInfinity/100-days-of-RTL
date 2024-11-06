`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/06/2024 06:17:44 AM
// Module Name: SR_latch
//////////////////////////////////////////////////////////////////////////////////


module SR_latch(
input S,R,
output Q,Qbar
    );
    
    assign Q = ~ (R | Qbar); 
    assign Qbar = ~ (S | Q); 
    
    
endmodule
