`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/27/2024 07:17:51 AM
// Module Name: three_to_eight_decoder
//////////////////////////////////////////////////////////////////////////////////


module three_to_eight_decoder(
    input [1:0]a,
    input en,
    output [7:0]y
    );
    decoder_2_4 Decoder_1 (.EN(~en),.A0(a[0]),.A1(a[1]),.D(y[3:0]));
    decoder_2_4 Decoder_2 (.EN(en),.A0(a[0]),.A1(a[1]),.D(y[7:4]));
endmodule
