`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/15/2024 12:16:02 AM
// Module Name: Square_Cube_root_tb
//////////////////////////////////////////////////////////////////////////////////


module Square_Cube_root_tb;
reg [31:0] number;
reg Sq_cube_sel;
wire [31:0] sq_root, cube_root;

Square_Cube_root DUT(number,Sq_cube_sel, sq_root, cube_root);

initial begin
	#10 number = 27;   Sq_cube_sel = 0;
	#10 number = 169;  Sq_cube_sel = 1;
	#10 number = 121;  Sq_cube_sel = 1;
	#10 number = 961;  Sq_cube_sel = 0;
	#10 number = 1024; Sq_cube_sel = 0;
	#10 number = 576;  Sq_cube_sel = 1;
	#10 number = 512;  Sq_cube_sel = 0;
	#10 number = 1764; Sq_cube_sel = 0;
	#10 number = 1000; Sq_cube_sel = 0;
	#10 number = 4761; Sq_cube_sel = 0;
	#10 number = 5832; Sq_cube_sel = 0;
	#10 $finish;
end
endmodule