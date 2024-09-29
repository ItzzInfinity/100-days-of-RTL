`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 09/30/2024 09:14:36 PM 
// Module Name: parallel_adder_subtractor_16b
//////////////////////////////////////////////////////////////////////////////////

module parallel_add_sub_tb;
   reg [15:0] x, y;
    reg selAddSub;
    wire [15:0] s;
    wire cout;
    parallel_adder_subtractor_16b dut (
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
            x = $random ;  
            y = $random ;  
            #10;
            selAddSub = 1'b1;  // Test subtraction
            x = $random ;  
            y = $random ;  
            #10;
        end
        $finish;
    end

endmodule
