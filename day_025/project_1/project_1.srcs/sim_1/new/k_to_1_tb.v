`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/16/2024 07:00:13 AM
// Module Name: k_to_1_tb
//////////////////////////////////////////////////////////////////////////////////

module k_to_1_tb;
  reg [63:0] a;
  reg [6:0] sel;     
  wire y;             
  k_to_1_mux #(64) uut (
    .a(a),
    .sel(sel),
    .y(y)
  );

  initial begin
    a = 64'h0;  
    #10;
    a = 64'hF0F0F0F0F0F0F0F0;  // Sample input pattern
    for (sel = 0; sel < 64; sel = sel + 1) begin
      #10; 
      $display("sel = %d, y = %b", sel, y);
    end
    $finish;
  end
endmodule



