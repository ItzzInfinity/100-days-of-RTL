`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Create Date: 11/29/2024 05:27:09 AM
// Module Name: Johnson_Counter
//////////////////////////////////////////////////////////////////////////////////


module Johnson_Counter(input clk,reset,
output [3:0] q);
 wire q_bar_3;

   d_ff d_ff_0(.sig(~q[3]), .clk(clk), .out(q[0]), .reset(reset)); 
   d_ff d_ff_1(.sig(q[0]),  .clk(clk), .out(q[1]), .reset(reset)); 
   d_ff d_ff_2(.sig(q[1]),  .clk(clk), .out(q[2]), .reset(reset)); 
   d_ff d_ff_3(.sig(q[2]),  .clk(clk), .out(q[3]), .reset(reset)); 
        
endmodule


module d_ff(
    input clk, reset, sig,
    output reg out
    );
    
    always@(posedge clk)
          begin
            if({reset})
                out<= 1'b0;
            else 
                out <= sig;
            end

endmodule