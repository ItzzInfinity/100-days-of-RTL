`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/28/2024 08:58:07 AM
// Module Name: ring_counter
//////////////////////////////////////////////////////////////////////////////////


module ring_counter #(parameter N=8)
    (input clk, reset,
    output reg [N-1:0] counter );

always @(posedge clk) 
    begin
    
    if (reset) 
        counter <= 1;
     
    else 
        counter <= {counter[0], counter[N-1:1]};
    
    end
endmodule
