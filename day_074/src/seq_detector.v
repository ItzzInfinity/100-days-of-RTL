//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 12/04/2024 08:16:09 AM
// Module Name: seq_detector
//////////////////////////////////////////////////////////////////////////////////

module seq_detector(
    input clk,reset,in,
    output reg detected_0110,detected_0111
);
    localparam 
        IDLE   = 3'b000,
        S0     = 3'b001,  // Detected '0'
        S01    = 3'b010,  // Detected '01'
        S011   = 3'b011,  // Detected '011'
        S0110  = 3'b100,  // Detected '0110'
        S0111  = 3'b101;   // Detected '0111';

reg [2:0] current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin

        next_state = current_state;
        detected_0110 = 1'b0;
        detected_0111 = 1'b0;

        case (current_state)
            IDLE: begin
                if (in)
                    next_state = IDLE;  // Stay in IDLE if input is '1'
                else
                    next_state = S0;    // Move to S0 if input is '0'
            end

            S0: begin
                if (in)
                    next_state = S01;  // Detected '01'
                else
                    next_state = S0;   // Stay in S0 if input is '0'
            end

            S01: begin
                if (in)
                    next_state = S011; // Detected '011'
                else
                    next_state = S0;   // Reset to S0 if input is '0'
            end

            S011: begin
                if (in)
                    next_state = S0111; // Detected '0111'
                else
                    next_state = S0110; // Detected '0110'
            end

            S0110: begin
                detected_0110 = 1'b1;   // Sequence '0110' detected
                next_state = S0;        // Reset to S0
            end

            S0111: begin
                detected_0111 = 1'b1;   // Sequence '0111' detected
                next_state = S0;        // Reset to S0
            end
        endcase
    end
endmodule
