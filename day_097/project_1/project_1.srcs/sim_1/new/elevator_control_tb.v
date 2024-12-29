`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/27/2024 09:42:00 AM
// Module Name: elevator_control_tb
//////////////////////////////////////////////////////////////////////////////////

module elevator_control_tb;

    reg clk;
    reg reset;
    reg [3:0] floor_request;
    reg emergency_stop;
    wire [1:0] state;
    wire [1:0] current_floor;
    wire door_open;

    elevator_control DUT (
        .clk(clk),
        .reset(reset),
        .floor_request(floor_request),
        .emergency_stop(emergency_stop),
        .state(state),
        .current_floor(current_floor),
        .door_open(door_open)
    );
    
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;
        floor_request = 0;
        emergency_stop = 0;
        
        #10 reset = 0;

        
        #10 floor_request = 3;
        #50 floor_request = 0; 

        // Emergency stop
        #20 emergency_stop = 1;
        #10 emergency_stop = 0;

        // Request floor 1
        #10 floor_request = 1;
        #50 floor_request = 0; 

        // Request floor 4
        #10 floor_request = 4;
        #50 floor_request = 0; 

        #50 $finish;
    end

    initial begin
$monitor("Time: %0t | State: %b | Current Floor: %d | Door Open: %b | Emergency Stop: %b",
                 $time, state, current_floor, door_open, emergency_stop);
    end
endmodule




































