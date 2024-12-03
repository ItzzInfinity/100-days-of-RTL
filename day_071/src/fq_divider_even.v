`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/01/2024 06:26:38 AM
// Module Name: fq_divider_even
//////////////////////////////////////////////////////////////////////////////////



module fq_divider_even(
    input clk, reset,
    output clk_by4
    );
    wire clk_by2;
    
    D_flipflop D1(clk, reset, ~clk_by4, clk_by2);
    D_flipflop D2(clk, reset, clk_by2, clk_by4);

endmodule























//module fq_divider_even#(parameter N = 2) (
//    input clk, reset,
//    output clk_out
//);
//    // Internal signals to connect D flip-flops
//    wire [N-1:0] div_clk;

//    // Generate N D flip-flops
//    genvar i;
//    generate
//        for (i = 0; i < N; i = i + 1) begin : gen_dff
//            if (i == 0) begin
//                // First D flip-flop
//                D_flipflop DFF (
//                    .clk(clk), 
//                    .reset(reset), 
//                    .d(~div_clk[i]), 
//                    .Q(div_clk[i])
//                );
//            end else begin
//                // Chain the rest of the D flip-flops
//                D_flipflop DFF (
//                    .clk(clk), 
//                    .reset(reset), 
//                    .d(div_clk[i-1]), 
//                    .Q(div_clk[i])
//                );
//            end
//        end
//    endgenerate

//    // Output the final divided clock
//    assign clk_out = div_clk[N-1];

    
    
    
//endmodule