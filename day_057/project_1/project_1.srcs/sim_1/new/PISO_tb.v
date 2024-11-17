`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/17/2024 02:04:10 AM
// Module Name: PISO_tb
//////////////////////////////////////////////////////////////////////////////////


module PISO_tb;
  
  reg clk, rst, load;
  reg [7:0] data_in;
  
  wire data_out;
  
  PISO DUT (load, clk, rst, data_in, data_out);
  
  always #1 clk = ~clk;

  
  initial begin
    clk = 0; rst = 0; load = 0; data_in = 8'h00;
    #3 rst = 1;
    #2 load = 1; data_in = 8'd15;    
    #2 load = 0;
    #16 load = 1; data_in = 8'd255;
    #2 load = 0;
    #16 load = 1; data_in = 8'd0;
    #2 load = 0;
    #18 $stop;
    
  end
  
endmodule







//module PISO_tb;
//reg a,b,c,d,clk,reset,shift_load;
//wire serial_out;

//    PISO DUT(a,b,c,d,clk,reset,shift_load,serial_out);
    
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk; // 10 ns period
//    end

//    initial begin
//        reset = 1;
        
//        #10 a=1;b=0;c=0;d=0;reset=0 ;shift_load=0;
//        #10 a=1;b=0;c=0;d=0;reset=0 ;shift_load=1;
//        #10 a=0;b=0;c=0;d=0;reset=0 ;shift_load=0;
//        #10 a=0;b=0;c=0;d=0;reset=0 ;shift_load=1;
//        #10 a=0;b=0;c=0;d=0;reset=0 ;shift_load=0;
//        #10 a=0;b=0;c=0;d=0;reset=0 ;shift_load=1;
//        #10 a=0;b=0;c=0;d=1;reset=0 ;shift_load=0;
//        #10 a=0;b=0;c=0;d=1;reset=0 ;shift_load=1;
//        #10 a=0;b=0;c=0;d=0;reset=0 ;shift_load=0;
//        #10 a=0;b=0;c=0;d=0;reset=0 ;shift_load=0;
      
//        #50;
//        reset = 1;
//        #10 reset = 0;
//        #20 $stop;
//    end


//endmodule