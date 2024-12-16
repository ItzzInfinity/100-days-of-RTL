`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/15/2024 12:13:25 AM
// Module Name: Square_Cube_root
//////////////////////////////////////////////////////////////////////////////////

module Square_Cube_root(
    input [31:0] number,     
    input Sq_cube_sel,       // Selector: 1 for square root, 0 for cube root
    output reg [31:0] sq_root, 
    output reg [31:0] cube_root 
);

    always @(number or Sq_cube_sel) begin
        if (Sq_cube_sel) begin
            find_sq(number, sq_root);
            $display("\n \t\t Square Root of %0d is %0d", number, sq_root);
        end else begin
            find_cube(number, cube_root);
            $display("\n \t\t Cube Root of %0d is %0d", number, cube_root);
        end
    end

    task find_sq;
        input [31:0] num;
        output [31:0] res;
        begin
            res = num**(0.5); 
        end
    endtask

    task find_cube;
        input [31:0] num;
        output [31:0] res;
        begin
            res = num**(0.33); 
        end
    endtask

endmodule
