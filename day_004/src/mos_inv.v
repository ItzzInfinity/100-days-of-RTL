`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/25/2024 09:54:11 AM
// Module Name: mos_inv_tb 
//////////////////////////////////////////////////////////////////////////////////


module mos_inv(
    input in,
    output out
    );
    
    supply0 gnd;
    supply1 vdd;
    
    pmos(out, vdd, in);
    nmos(out, gnd, in);
    
endmodule