`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/21/2024 03:41:47 AM
// Module Name: traffic_light_controller
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller(
    input clk,        
    input rst,        
    output reg [7:0] Main_road,  
    output reg [7:0] Cross_road  
);

    // State encoding using localparams
    localparam MAIN_GREEN  = 2'b00; 
    localparam MAIN_YELLOW = 2'b01; 
    localparam CROSS_GREEN = 2'b10; 
    localparam CROSS_YELLOW = 2'b11; 

    reg [1:0] current_state, next_state; 

    integer counter;


    localparam GREEN_TIME = 10;   // Green light duration
    localparam YELLOW_TIME = 3;  // Yellow light duration


    localparam [7:0] GREEN = 8'b01000111;
    localparam [7:0] YELLOW = 8'b01011001;
    localparam [7:0] RED = 8'b01010010;

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= MAIN_GREEN; // Reset to initial state
            counter <= 0;
        end else begin
            if (counter == 0) // Move to the next state when timer expires
                current_state <= next_state;
            else
                counter <= counter - 1; 
        end
    end

   
    always @(*) begin
       
        next_state = current_state;
        Main_road = RED;   
        Cross_road = RED;  

        case (current_state)
            MAIN_GREEN: begin
                Main_road = GREEN;
                Cross_road = RED;
                counter = GREEN_TIME;
                next_state = MAIN_YELLOW;
            end

            MAIN_YELLOW: begin
                Main_road = YELLOW;
                Cross_road = RED;
                counter = YELLOW_TIME;
                next_state = CROSS_GREEN;
            end

            CROSS_GREEN: begin
                Main_road = RED;
                Cross_road = GREEN;
                counter = GREEN_TIME;
                next_state = CROSS_YELLOW;
            end

            CROSS_YELLOW: begin
                Main_road = RED;
                Cross_road = YELLOW;
                counter = YELLOW_TIME;
                next_state = MAIN_GREEN;
            end
        endcase
    end

endmodule













