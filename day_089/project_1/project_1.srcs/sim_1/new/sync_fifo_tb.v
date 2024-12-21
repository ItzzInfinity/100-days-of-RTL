`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/19/2024 08:30:28 AM
// Module Name: sync_fifo_tb
//////////////////////////////////////////////////////////////////////////////////

module sync_fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 16;

    reg clk, reset, wr_en, rd_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full, empty;

    sync_fifo #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH)) DUT (
        .clk(clk),.reset(reset),
        .wr_en(wr_en),.rd_en(rd_en),
        .data_in(data_in),.data_out(data_out),
        .full(full),.empty(empty)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0; reset = 1; wr_en = 0; rd_en = 0; data_in = 0;
        #10 reset = 0;
 
        $display("Writing Data into FIFO...");       // Write data into the FIFO
        repeat (5) begin
            @(posedge clk);
            wr_en = 1; rd_en = 0;
            data_in = $random % 256; // Random 8-bit data
            $display("Time: %0t | Writing: %0d", $time, data_in);
        end
        wr_en = 0;

        $display("Reading Data from FIFO...");        // Read data from the FIFO
        repeat (5) begin
            @(posedge clk);
            rd_en = 1; wr_en = 0;
            $display("Time: %0t | Reading: %0d", $time, data_out);
        end
        rd_en = 0;
        #10 $finish;
    end
endmodule

