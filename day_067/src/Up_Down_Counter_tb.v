`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/24/2024 06:22:12 AM
// Module Name: Up_Down_Counter_tb
//////////////////////////////////////////////////////////////////////////////////


module Up_Down_Counter_tb;
parameter N = 10;
  parameter WIDTH = 4;
  reg dir;
  reg clk;
  reg rstn;
  wire [WIDTH-1:0] out;

  Up_Down_Counter DUT( 	.clk(clk),
                	.rstn(rstn),
                	.out(out),
                	.dir(dir));

  always #10 clk = ~clk;

  initial begin
    {clk, rstn} <= 0;
    // up count
    $monitor ("T=%0t rstn=%0b out=0x%0h", $time, rstn, out);
    repeat(2) @ (posedge clk);
    rstn <= 1;
    dir <=1;
    repeat(11) @ (posedge clk);
     // down time
    rstn <= 0;

    $monitor ("T=%0t rstn=%0b out=0x%0h", $time, rstn, out);
    repeat(2) @ (posedge clk);
    rstn <= 1;
    dir <=0;
    repeat(11) @ (posedge clk);
    $finish;
  end
endmodule
