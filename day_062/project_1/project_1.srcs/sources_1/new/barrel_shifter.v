`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/23/2024 07:57:54 AM
// Module Name: barrel_shifter
//////////////////////////////////////////////////////////////////////////////////

module barrel_shifter(
    input [7:0] data_in,
    input [2:0] shift,
    input dir, // 0 for right, 1 for left
    output reg [7:0] data_out
    );
    
    always @(*) begin
        case ({dir, shift})
            4'd0: data_out = data_in >> 1; // Right shift by 1
            4'd1: data_out = data_in >> 2; // Right shift by 2
            4'd2: data_out = data_in >> 3; // Right shift by 3
            4'd3: data_out = data_in >> 4; // Right shift by 4
            4'd4: data_out = data_in >> 5; // Right shift by 5
            4'd5: data_out = data_in >> 6; // Right shift by 6
            4'd6: data_out = data_in >> 7; // Right shift by 7
            
            /*                  Dir Change                  */
            
            4'd8: data_out = data_in << 1; // Left shift by 1
            4'd9: data_out = data_in << 2; // Left shift by 2
            4'd10: data_out = data_in << 3; // Left shift by 3
            4'd11: data_out = data_in << 4; // Left shift by 4
            4'd12: data_out = data_in << 5; // Left shift by 5
            4'd13: data_out = data_in << 6; // Left shift by 6
            4'd14: data_out = data_in << 7; // Left shift by 7
            default: data_out = data_in;
        endcase
    end
    
    
    
endmodule
