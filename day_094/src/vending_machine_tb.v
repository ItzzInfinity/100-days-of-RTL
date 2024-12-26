`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/24/2024 12:12:27 AM
// Module Name: vending_machine_tb
//////////////////////////////////////////////////////////////////////////////////

module vending_machine_tb;

    reg clk;
    reg reset;
    reg [1:0] coin;
    reg select_item;
    wire dispense;
    wire [3:0] change;

    vending_machine DUT (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .select_item(select_item),
        .dispense(dispense),
        .change(change)
    );

    always #5 clk = ~clk; 

    initial begin
        
        clk = 0;
        reset = 1;
        coin = 0;
        select_item = 0;
        
        #10 reset = 0;

        // Scenario 1: Insert two 1-unit coins and select an item
        #10 coin = 2'b01; 
        #10 coin = 0;
        #10 coin = 2'b01; 
        #10 coin = 0;
        #10 select_item = 1; 
        #10 select_item = 0;

        // Scenario 2: Insert a 2-unit coin directly
        #10 coin = 2'b10; 
        #10 coin = 0;
        #10 select_item = 1; 
        #10 select_item = 0;
        #40;

        // Scenario 3: Insert extra coins and get change
        #10 coin = 2'b10; 
        #10 coin = 0;
        #10 coin = 2'b01; 
        #10 coin = 0;
        #10 select_item = 1; 
        #10 select_item = 0;

        #10 reset = 1;
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | reset=%b | coin=%b | select_item=%b | dispense=%b | change=%d", 
                 $time, reset, coin, select_item, dispense, change);
    end

endmodule

