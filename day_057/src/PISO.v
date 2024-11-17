`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/17/2024 11:12:24 AM
// Module Name: PISO
//////////////////////////////////////////////////////////////////////////////////

module PISO (input load, clk, rst,
             input [7:0] data_in,
             output reg data_out);
  
  // PISO register array to load and shift data
  reg [7:0] data_reg;
  
  always @ (posedge clk or negedge rst) begin
    if (~rst)
      data_reg <= 8'h00; // Reset PISO register array on reset
    else begin
      
      // Load the data to the PISO register array and reset the serial data out register
      if (load)
      	{data_reg, data_out} <= {data_in, 1'b0};
      // Shift the loaded data 1 bit right; into the serial data out register
      else
      	{data_reg, data_out} <= {1'b0, data_reg[7:0]};
    end
  end
  
endmodule













//module PISO(
//input a,b,c,d,clk,reset,shift_load,
//output serial_out
//    );
    
//    wire Qa,Qb,Qc;
//    wire Ib,Ic,Id;
//    D_flipflop D0 (.d(a), .clk(clk), .reset(reset), .Q(Qa));
//    D_flipflop D1 (.d(Ib), .clk(clk), .reset(reset), .Q(Qb));
//    D_flipflop D2 (.d(Ic), .clk(clk), .reset(reset), .Q(Qc));
//    D_flipflop D3 (.d(Id), .clk(clk), .reset(reset), .Q(serial_out));
//    assign Ib = (Qa & shift_load) | (~shift_load & b);
//    assign Ic = (Qb & shift_load) | (~shift_load & c);
//    assign Id = (Qc & shift_load) | (~shift_load & d);
//endmodule

// Code your design here