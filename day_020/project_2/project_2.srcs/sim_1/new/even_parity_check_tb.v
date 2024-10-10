`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/11/2024 11:56:23 AM
// Module Name: even_parity_check_tb
//////////////////////////////////////////////////////////////////////////////////


module even_parity_check_tb;
    reg [7:0] a;
    reg manual_entry;
    wire p_check,error;
    wire [8:0] b;

    even_parity_checker DUT(a,manual_entry,p_check,error,b);
    
        initial begin
        repeat(5) begin
        $monitor("For digit %d (%b) the generated parity bit is --> %b & error --> %b",a,a,p_check,error);
        a = $random(); manual_entry=1'b0; #10;

        end
        begin
                                            // Manually entering wrong parity bit
        a = 8'd114; manual_entry=1'b1; #10;
        a = 8'd172; manual_entry=1'b1; #10;
        a = 8'd89; manual_entry=1'b1; #10;
        a = 8'd31; manual_entry=1'b1; #10;
        a = 8'd15; manual_entry=1'b1; #10;

        $finish;
        end
    end
endmodule
