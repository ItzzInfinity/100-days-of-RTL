`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/23/2024 06:53:36 AM
// Module Name: pwm_generator_tb
//////////////////////////////////////////////////////////////////////////////////

module pwm_generator_tb;

    reg clk;
    reg rst_n;
    reg [7:0] duty_cycle;
    wire pwm_out;

    pwm_generator uut (
        .clk(clk),
        .rst_n(rst_n),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    initial clk = 0;
    always #2 clk = ~clk;

    initial begin

        $monitor("Time=%0d, Duty_Cycle=%d, PWM_Out=%b", $time, (duty_cycle*100)/256, pwm_out);

        rst_n = 0; duty_cycle = 8'd0;
        #10 rst_n = 1;

        duty_cycle = 8'd64; // 25% of 256
        #3000;

        duty_cycle = 8'd128; // 50% of 256
        #3000;

        duty_cycle = 8'd192; // 75% of 256
        #3000;

        duty_cycle = 8'd255; // 100% of 256
        #3000;

        $finish;
    end
endmodule
