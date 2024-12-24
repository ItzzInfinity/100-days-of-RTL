`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/22/2024 04:58:11 AM
// Module Name: washing_machine_fsm_tb
//////////////////////////////////////////////////////////////////////////////////

module washing_machine_fsm_tb;

    reg clk;
    reg rst_n;
    reg start;
    reg door_closed;
    reg water_level;
    reg cycle_complete;
    wire [2:0] state;
    wire motor_on;
    wire water_valve;
    wire drain_valve;
    wire buzzer;
    
    washing_machine_fsm DUT (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .door_closed(door_closed),
        .water_level(water_level),
        .cycle_complete(cycle_complete),
        .state(state),
        .motor_on(motor_on),
        .water_valve(water_valve),
        .drain_valve(drain_valve),
        .buzzer(buzzer)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0d, State=%b, Motor=%b, WaterValve=%b, DrainValve=%b, Buzzer=%b",
                 $time, state, motor_on, water_valve, drain_valve, buzzer);

        rst_n = 0; start = 0; door_closed = 0; water_level = 0; cycle_complete = 0;
        #10 rst_n = 1;

        // Start the machine with door closed
        start = 1; door_closed = 1; #10;

        // Simulate water filling
        water_level = 1; #20;

        // Simulate wash cycle completion
        cycle_complete = 1; #10 cycle_complete = 0;

        // Simulate rinse cycle completion
        cycle_complete = 1; #10 cycle_complete = 0;

        // Simulate spin cycle completion
        cycle_complete = 1; #10 cycle_complete = 0;

        // Simulate draining water
        cycle_complete = 1; #10 cycle_complete = 0;

        // Machine reaches end state
        #20;

        // Trigger error: Open door during operation
        door_closed = 0; #10;
        door_closed = 1; start = 0; #10;

        $finish;
    end
endmodule
























