`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/01/2024 06:42:06 AM
// Module Name: tb_fq_divider_even
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_fq_divider_even;

reg clk, reset;
wire clk_by4;

fq_divider_even DUT(clk, reset, clk_by4);

initial begin
clk= 1'b0;
forever #10 clk= ~clk;
end
initial begin
reset= 1'b1;
#20
reset= 1'b0;
#220 $finish;
end
endmodule




























//    // Testbench Parameters
//    parameter N = 2; // Can be changed to test different division factors

//    // Testbench Signals
//    reg clk;
//    reg reset;
//    wire clk_out;

//    // Instantiate the DUT (Device Under Test)
//    fq_divider_even #(N) DUT (
//        .clk(clk),
//        .reset(reset),
//        .clk_out(clk_out)
//    );

//    // Clock generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk; // 10ns clock period (100 MHz frequency)
//    end

////    // Test sequence
////    initial begin
////        // Apply Reset
////        reset = 1;
////        #15;
////        reset = 0;

////        // Observe Output
////        #200;

////        // Apply Reset again
////        reset = 1;
////        #15;
////        reset = 0;

////        #200;

////        $stop; // End simulation
////    end

////    // Monitor signals
////    initial begin
////        $monitor("Time = %0dns, clk = %b, reset = %b, clk_out = %b", $time, clk, reset, clk_out);
////    end

////endmodule

////initial begin
////clk= 1'b0;
////forever #10 clk= ~clk;
////end
//initial begin
//reset= 1'b1;
//#20
//reset= 1'b0;
//#220 $finish;
//end
//endmodule