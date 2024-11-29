`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/27/2024 06:20:37 AM
// Module Name: Up_Down_Counter
//////////////////////////////////////////////////////////////////////////////////


module Up_Down_Counter #(parameter N = 10,
     parameter WIDTH = 4)

  ( input   clk,
    input   rstn,
    input   dir,
   	output  reg [WIDTH-1:0] out);

  always @ (posedge clk) begin
    if (!rstn) begin
      out <= 0;
    end else begin
    case(dir)
    1'b1: begin
      if (out == N-1)
        out <= 0;
      else
        out <= out + 1;
        end 
     1'b0: begin
        if (out == 0)
        out <= 9;
      else
        out <= out - 1;
        end 
     endcase
     
     end
    end 
endmodule
