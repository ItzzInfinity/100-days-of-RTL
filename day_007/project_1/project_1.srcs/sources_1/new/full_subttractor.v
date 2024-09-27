`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/28/2024 10:15:06 PM
// Module Name: full_subtractor
//////////////////////////////////////////////////////////////////////////////////

/* Full Substractor */

module full_subtractor( 
   input X,Y,Bin, 
   output D,Bout);
	assign Bout = (~X && Y)||(~X && Bin)||(Y && Bin);
	assign D = (X ^ Y ^  Bin);
	endmodule
