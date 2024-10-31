`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/31/2024 08:14:07 AM
// Module Name: tb_monostable_multivibrator
//////////////////////////////////////////////////////////////////////////////////

module tb_monostable_multivibrator;

    reg clk;           // Clock signal
    reg rst;           // Reset signal
    reg trigger;       // Trigger input
    wire out;          // Output pulse
    
    monostable_multivibrator UUT (.clk(clk),.rst(rst),.trigger(trigger),.out(out));
    
    always #5 clk = ~clk; 

    initial begin
        // Initialize all signals
        clk = 0;
        rst = 1;
        trigger = 0;

        #20 rst = 0;

        #30 trigger = 1;  // Trigger pulse starts at 30ns
        #10 trigger = 0;  // Stop trigger after 10ns

        #100 trigger = 1;  // Trigger again at 130ns
        #10 trigger = 0;   // Stop trigger after 10ns

        #200 trigger = 1;  // Trigger again at 340ns
        #10 trigger = 0;   // Stop trigger after 10ns

        // End the simulation after sufficient time
        #500 $finish;
    end
    initial begin
        $monitor("Time = %0t | Reset = %b | Trigger = %b | Output = %b", $time, rst, trigger, out);
    end

endmodule

