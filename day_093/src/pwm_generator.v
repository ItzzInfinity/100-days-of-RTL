`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/23/2024 06:52:33 AM
// Module Name: pwm_generator
//////////////////////////////////////////////////////////////////////////////////

module pwm_generator (
    input clk,               // System clock
    input rst_n,             // Active low reset
    input [7:0] duty_cycle,  // Duty cycle (0 to 255 for 8-bit resolution)
    output reg pwm_out       // PWM output signal
);

    reg [7:0] counter;       // 8-bit counter for PWM

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= 8'd0;
        else
            counter <= counter + 1;
    end

    // PWM generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pwm_out <= 1'b0;
        else
            pwm_out <= (counter < duty_cycle) ? 1'b1 : 1'b0;
    end

endmodule
