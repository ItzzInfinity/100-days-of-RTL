`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/30/2024 05:02:55 AM
// Module Name: clock_edge_tb
//////////////////////////////////////////////////////////////////////////////////


module clock_edge_tb;
	reg sig;         
	reg clk;         
    wire neg_edge,pos_edge;
    
	clk_edge_detector DUT (  .sig(sig),
    					 .clk(clk),
 			      		 .pos_edge(pos_edge),
 			      		 .neg_edge(neg_edge)
 			      		 );

	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		sig <= 0;
		#15 sig <= 1;
		#20 sig <= 0;
		#15 sig <= 1;
		#10 sig <= 0;
		#20 $finish;
	end
endmodule
