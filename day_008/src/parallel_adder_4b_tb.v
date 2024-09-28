`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/29/2024 08:27:49 PM
// Module Name: parallel_adder_4b_tb
//////////////////////////////////////////////////////////////////////////////////
module parallel_adder_4b_tb;

    reg [3:0] x, y;
    reg selAddSub;
    wire [3:0] s;
    wire cout;
    parallel_adder_4b dut (
        .x(x),
        .y(y),
        .selAddSub(selAddSub),
        .s(s),
        .cout(cout)
    );
    initial begin
        
        $display("x    y    selAddSub | s    cout");
        $monitor("%d %d %b | %d %b", x, y, selAddSub, s, cout);

        // Generate random values for addition (selAddSub = 0) and subtraction (selAddSub = 1)
        repeat (10) begin
            selAddSub = 1'b0;  // Test addition
            x = $random % 16;  
            y = $random % 16;  
            #10;
            selAddSub = 1'b1;  // Test subtraction
            x = $random % 16;  
            y = $random % 16;  
            #10;
        end
        $finish;
    end

endmodule
