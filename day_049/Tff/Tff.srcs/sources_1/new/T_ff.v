`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/09/2024 06:55:45 AM
// Module Name: T_ff
//////////////////////////////////////////////////////////////////////////////////

module T_ff(
    input t,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if(reset)
               Q <= 1'b0;
            else
                begin
                   if(t)
                    Q<= ~Q;
                   else
                    Q<= Q;                     
                end
          end
endmodule
