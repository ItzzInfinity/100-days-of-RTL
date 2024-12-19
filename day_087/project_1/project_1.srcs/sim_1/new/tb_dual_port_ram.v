`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/13/2024 11:02:21 PM
// Module Name: tb_dual_port_ram
//////////////////////////////////////////////////////////////////////////////////

module tb_dual_port_ram;
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg clk;
    reg we_a, we_b;
    reg [ADDR_WIDTH-1:0] addr_a, addr_b;
    reg [DATA_WIDTH-1:0] data_a, data_b;
    wire [DATA_WIDTH-1:0] q_a, q_b;

    dual_port_ram #(DATA_WIDTH, ADDR_WIDTH) DUT (
        .clk(clk),
        .we_a(we_a),     .we_b(we_b),
        .addr_a(addr_a), .addr_b(addr_b),
        .data_a(data_a), .data_b(data_b),
        .q_a(q_a),       .q_b(q_b)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        we_a = 0; we_b = 0;
        addr_a = 0; addr_b = 0;
        data_a = 0; data_b = 0;

        // Write to Port A
        #10 we_a = 1; addr_a = 4'b0010; data_a = 8'hAA; 
        #10 we_a = 0;

        // Write to Port B
        #10 we_b = 1; addr_b = 4'b0011; data_b = 8'hBB;
        #10 we_b = 0;

        // Read from Port A
        #10 addr_a = 4'b0010; 

        // Read from Port B
        #10 addr_b = 4'b0011; 

        // Write to both ports simultaneously
        #10 we_a = 1; we_b = 1;
            addr_a = 4'b0001; data_a = 8'hCC;  
            addr_b = 4'b0100; data_b = 8'hDD;  
        #10 we_a = 0; we_b = 0;

        // Read from both ports
        #10 addr_a = 4'b0001; 
            addr_b = 4'b0100; 

        #20 $stop;
    end
endmodule
