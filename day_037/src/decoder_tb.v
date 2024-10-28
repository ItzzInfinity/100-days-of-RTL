`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/28/2024 05:21:13 AM
// Module Name: decoder_tb
//////////////////////////////////////////////////////////////////////////////////


module decoder_tb;
  reg [4:0]in;
  reg enable;
  wire [31:0]out;
  
  
  decoder_5_to_32 DUT(in, enable, out);
  
  initial begin
    $monitor("in = %b, enable = %b, out = %b", in, enable, out);
    $dumpfile("dump.vcd"); $dumpvars;
    enable = 1'b1;
    in=32'd0;
    #5;
    	  if(out==2**in)
            $display("correct");
          else
         	$display("wrong");
    
    repeat(50) begin
      in=in+1;
      #2;
      	  if(out==2**in)
            $display("correct");
          else
         	$display("wrong");      
    end
  end
endmodule