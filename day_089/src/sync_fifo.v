`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/19/2024 08:28:08 AM
// Module Name: sync_fifo
//////////////////////////////////////////////////////////////////////////////////

module sync_fifo #(
    parameter DATA_WIDTH = 8, 
    parameter DEPTH = 16      
)(
    input wire clk,rd_en,wr_en,reset,    
    input wire [DATA_WIDTH-1:0] data_in, 
    output reg [DATA_WIDTH-1:0] data_out,
    output reg full, empty          
);

    // Declare FIFO memory
    reg [DATA_WIDTH-1:0] fifo_mem [0:DEPTH-1];

    reg [$clog2(DEPTH):0] wr_ptr; 
    reg [$clog2(DEPTH):0] rd_ptr; 
    reg [$clog2(DEPTH):0] count;  

    always @(posedge clk) begin
        if (reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
            full   <= 0;
            empty  <= 1;
        end
        else begin
            if (wr_en && !full) begin
                fifo_mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
                count <= count + 1;
            end
            if (rd_en && !empty) begin
                data_out <= fifo_mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                count <= count - 1;
            end
            
            full <= (count == DEPTH);
            empty <= (count == 0);
        end
    end
endmodule
