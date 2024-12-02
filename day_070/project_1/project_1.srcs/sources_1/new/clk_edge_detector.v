`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/30/2024 04:56:26 AM
// Module Name: clk_edge_detector
//////////////////////////////////////////////////////////////////////////////////


module clk_edge_detector( 
    input sig,       
    input clk,           
    output pos_edge,         
    output neg_edge);          

    reg   sig_dly;                         

	always @ (posedge clk) begin
		sig_dly <= sig;
	end
	
	assign pos_edge =  sig & ~sig_dly;
	assign neg_edge = ~sig &  sig_dly;
endmodule


