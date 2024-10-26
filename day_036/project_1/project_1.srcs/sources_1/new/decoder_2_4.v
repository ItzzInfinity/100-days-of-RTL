`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/27/2024 05:16:21 AM
// Module Name: decoder_2_4
//////////////////////////////////////////////////////////////////////////////////


module decoder_2_4(EN, A0, A1, D);
 input EN, A0, A1;
 output [3:0] D;

 assign D[0] =(EN & ~A1 & ~A0);
 assign D[1] =(EN & ~A1 & A0);
 assign D[2] =(EN & A1 & ~A0);
 assign D[3] =(EN & A1 & A0);
endmodule