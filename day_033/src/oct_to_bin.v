`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/06/2024 07:23:13 AM
// Module Name: oct_to_bin
//////////////////////////////////////////////////////////////////////////////////


module oct_to_bin(
    input[7:0]d,
    output[2:0]y);
    
        or (y[0],d[1],d[3],d[5],d[7]);
        or (y[1],d[2],d[3],d[6],d[7]);
        or (y[2],d[4],d[5],d[6],d[7]);
        //assign y[0] = d[1]|d[3]|d[5]|d[7];
        //assign y[1] = d[2]|d[3]|d[6]|d[7];
        //assign y[2] = d[4]|d[5]|d[6]|d[7];

endmodule

