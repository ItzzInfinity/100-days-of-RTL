module seven_segment_decoder(
    input wire Clk,                 // 27 MHz clock signal
    input wire [3:0] ones,          // Ones place digit (BCD)
    input wire [3:0] tens,          // Tens place digit (BCD)
    input wire [3:0] hundreds,      // Hundreds place digit (BCD)
    output reg [6:0] seg,           // 7-segment display output
    output reg [3:0] digit          // Anode control for the 4 digits
    );

    // Internal signals
    reg [3:0] current_digit;        // Current digit value (BCD)
    reg [1:0] digit_select = 2'b00; // Digit selection (0=hundreds, 1=tens, 2=ones)
    reg [19:0] refresh_counter = 0; // Refresh counter for 1 kHz digit refresh rate

    // Clock divider to create 1 kHz refresh rate (27 MHz / 27000 = 1 kHz)
    always @(posedge Clk) begin
        refresh_counter <= refresh_counter + 1;
        if (refresh_counter == 27000) begin
            refresh_counter <= 0;
            digit_select <= digit_select + 1;  // Cycle through digits
        end
    end

    // 7-segment display decoder
    always @(*) begin
        case (current_digit)
            4'd0: seg = 7'b0111111; // 0
            4'd1: seg = 7'b0000110; // 1
            4'd2: seg = 7'b1011011; // 2
            4'd3: seg = 7'b1001111; // 3
            4'd4: seg = 7'b1100110; // 4
            4'd5: seg = 7'b1101101; // 5
            4'd6: seg = 7'b1111101; // 6
            4'd7: seg = 7'b0000111; // 7
            4'd8: seg = 7'b1111111; // 8
            4'd9: seg = 7'b1101111; // 9
            default: seg = 7'b0000000; // Blank display for undefined digits
        endcase
    end

    // Select the current digit and anode
    always @(*) begin
        case (digit_select)

            2'b00: begin
                current_digit = 4'd0; 
                digit = 4'b0111;          // Activate thousands digit
            end
            2'b01: begin
                current_digit = hundreds; // Hundreds place
                digit = 4'b1011;          // Activate hundreds digit
            end
            2'b10: begin
                current_digit = tens;     // Tens place
                digit = 4'b1101;          // Activate tens digit
            end
            2'b11: begin
                current_digit = ones;     // Ones place
                digit = 4'b1110;          // Activate ones digit
            end
            default: begin
                current_digit = 4'd0;     // Default to 0
                digit = 4'b1111;          // Turn off all digits
            end
        endcase
    end
endmodule
