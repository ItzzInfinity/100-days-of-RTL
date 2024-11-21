`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/23/2024 08:11:41 AM
// Module Name: barrel_shifter_tb
//////////////////////////////////////////////////////////////////////////////////


module barrel_shifter_tb;
    reg [7:0] data_in;   
    reg [2:0] shift;     
    reg dir;             
    wire [7:0] data_out; 

    barrel_shifter DUT (.data_in(data_in),.shift(shift),.dir(dir),.data_out(data_out));

    initial begin
        
        data_in = 8'b11110000;
        dir = 0;
        shift = 3'b000;
        
        
        #10 shift = 3'b001; dir = 0; 
        #10 shift = 3'b010; dir = 0; 
        #10 shift = 3'b011; dir = 0; 
        #10 shift = 3'b100; dir = 1; 
        #10 shift = 3'b101; dir = 1; 
        #10 shift = 3'b110; dir = 1; 
        #10 shift = 3'b111; dir = 1;       
       
        #10 data_in = 8'b11001100; shift = 3'b001; dir = 0; 
        #10 data_in = 8'b00011111; shift = 3'b010; dir = 1; 
        #10 data_in = 8'b10101010; shift = 3'b011; dir = 0; 
        
        #10 shift = 3'b000; dir = 1; // No shift       
       
        #10 $stop;
    end

    initial begin
        $monitor("At time %t: data_in = %b, shift = %b, dir = %b, data_out = %b", 
                  $time, data_in, shift, dir, data_out);
    end
endmodule
