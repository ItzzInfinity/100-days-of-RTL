`timescale 10ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/24/2024 10:42:52 PM
// Module Name: gate_level
//////////////////////////////////////////////////////////////////////////////////


module gate_level_tb;
    reg i1,i2,ctrl;
    wire o_and,o_or,o_nand,o_nor,o_xnor,o_xor,buf_0,buf_1;
 gate_level DUT (i1,i2,ctrl,o_and,o_or,o_nand,o_nor,o_xnor,o_xor,buf_0,buf_1);
        initial begin
            #10 i1 = 1'b0; i2 = 1'b0;
            #10 i1 = 1'b0; i2 = 1'b1;
            #10 i1 = 1'b1; i2 = 1'b0;
            #10 i1 = 1'b1; i2 = 1'b1;
        end 

endmodule
