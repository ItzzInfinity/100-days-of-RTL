//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/13/2024 09:26:09 AM
// Module Name: stopwatch_tb
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ms / 1us  // (1ms time unit, 1us precision)

module stopwatch_tb;
    reg clk;
    reg reset_n;
    reg lap;
    wire [5:0] min;
    wire [5:0] sec;
    wire [5:0] lap_min;
    wire [5:0] lap_sec;

    stopwatch DUT (
        .clk(clk),.reset_n(reset_n),
        .lap(lap),.sec(sec),.min(min),
        .lap_sec(lap_sec),.lap_min(lap_min));
        
    always begin
        #500 clk = ~clk;
    end

    initial begin
        clk = 0; reset_n = 0; lap = 0;
        
        #1 reset_n = 1;  // Reset the stopwatch
        #2000;           
        
           lap = 1;
        #5 lap = 0;  
        #2000;       
        
           lap = 1;
        #5 lap = 0;  
        #2000;       
        
           reset_n = 0;
        #1 reset_n = 1;
        #2000;  

        $stop;  
    end
endmodule
