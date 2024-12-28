`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/26/2024 08:23:08 AM
// Module Name: car_parking_system_tb
//////////////////////////////////////////////////////////////////////////////////

module car_parking_system_tb;

    parameter MAX_CAPACITY = 10;

    reg clk,reset,entry_sensor,exit_sensor;
    wire [3:0] car_count;
    wire parking_full;
    
    car_parking_system #(MAX_CAPACITY) DUT (
        .clk(clk),.reset(reset),
        .entry_sensor(entry_sensor),.exit_sensor(exit_sensor),
        .car_count(car_count),.parking_full(parking_full)
    );
    
    always #5 clk = ~clk;

    initial begin
    
        clk = 0;
        reset = 1;
        entry_sensor = 0;
        exit_sensor = 0;

        #10 reset = 0;
        #10 entry_sensor = 1; #10 entry_sensor = 0; // 1 car enters
        #10 entry_sensor = 1; #10 entry_sensor = 0; // Another car enters
        #10 exit_sensor = 1; #10 exit_sensor = 0;    // Simulate cars exiting
        
        repeat (10) begin    // Simulate parking full scenario
            #10 entry_sensor = 1; #10 entry_sensor = 0; // Cars enter until full
        end
        #10 entry_sensor = 1; #10 entry_sensor = 0;    // Try entering when parking is full
        
        repeat (MAX_CAPACITY) begin    // Cars exiting after being full
            #10 exit_sensor = 1; #10 exit_sensor = 0;
        end
        #50 $finish;
    end
    initial begin
$monitor("Time=%0t | Reset=%b | Entry Sensor=%b | Exit Sensor=%b | Car Count=%d | Parking Full=%b",
                  $time, reset, entry_sensor, exit_sensor, car_count, parking_full);
    end
endmodule
