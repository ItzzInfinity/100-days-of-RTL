`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan prasd
// Create Date: 10/21/2024 06:16:36 AM
// Module Name: tb_demux_32_to_1
//////////////////////////////////////////////////////////////////////////////////

module tb_demux_32_to_1;
 
  reg [4:0] sel;          
  reg din;                
  wire [31:0] dout;      
  
  demux_32_to_1 uut (
    .sel(sel),
    .din(din),
    .dout(dout)
  );
  initial begin
    din = 1; 
    for (sel = 5'd0; sel <= 5'd31; sel = sel + 1) begin
        #10; 
    end
    $stop;
  end

endmodule
