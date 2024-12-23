`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/21/2024 03:50:35 AM
// Module Name: traffic_light_controller_tb
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller_tb;

    reg clk;
    reg rst;

    wire [7:0] Main_road;
    wire [7:0] Cross_road;

    traffic_light_controller DUT (
        .clk(clk),
        .rst(rst),
        .Main_road(Main_road),
        .Cross_road(Cross_road)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        $monitor("Time: %0t | Reset: %b | Main_road: %b | Cross_road: %b",
                 $time, rst, Main_road, Cross_road);

        rst = 1;
        #20;
        rst = 0;

        // Let the simulation run for a sufficient time to observe state transitions
        #1000;

        $finish;
    end

endmodule

