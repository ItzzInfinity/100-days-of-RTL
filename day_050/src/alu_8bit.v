`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 11/10/2024 05:20:17 AM
// Module Name: alu_8bit
//////////////////////////////////////////////////////////////////////////////////

module alu_8bit (
    
//    input wire Clk, 
    input wire [7:0] A,                                     // 8-bit input A
    input wire [7:0] B,                                     // 8-bit input B
    input wire [3:0] opcode,                                // 4-bit opcode for operation select
    output reg [7:0] result,                                // 8-bit ALU result
    output reg carry,                                       // Carry flag
    output reg zero,                                        // Zero flag
    output reg overflow,                                    // Overflow flag
    output reg sign                                         // Sign flag
);

    reg [15:0] temp;                                        // Temporary register to store result for wide operations

    // Opcode Definitions (4-bit values)
    localparam ADD    = 4'b0000;                            // Addition
    localparam SUB    = 4'b0001;                            // Subtraction
    localparam AND    = 4'b0010;                            // Bitwise AND
    localparam OR     = 4'b0011;                            // Bitwise OR
    localparam XOR    = 4'b0100;                            // Bitwise XOR
    localparam NOT    = 4'b0101;                            // Bitwise NOT (A only)
    localparam LSHIFT = 4'b0110;                            // Logical Shift Left
    localparam RSHIFT = 4'b0111;                            // Logical Shift Right
    localparam LT     = 4'b1000;                            // Less Than (A < B)
    localparam EQ     = 4'b1001;                            // Equal (A == B)
    localparam INC    = 4'b1010;                            // Increment A
    localparam DEC    = 4'b1011;                            // Decrement A
    localparam MUL    = 4'b1100;                            // Multiplication (A * B)
    localparam DIV    = 4'b1101;                            // Division (A / B)
    
    // ALU Operations based on Opcode
    always @(*) begin
    
                                                            // Initialize flags
        carry = 0;
        overflow = 0;
        zero = 0;
        sign = 0;

        case (opcode)
            ADD: begin                                      // Addition
                temp = A + B;
                result = temp[7:0];
                carry = temp[8];  // Capture carry
                overflow = (~A[7] & ~B[7] & result[7]) | (A[7] & B[7] & ~result[7]);  // Overflow check
            end
            SUB: begin                                      // Subtraction
                temp = A - B;
                result = temp[7:0];
                carry = (A < B);                            // Capture borrow
                overflow = (A[7] & ~B[7] & ~result[7]) | (~A[7] & B[7] & result[7]);  // Overflow check
            end
            AND: result = A & B;                            // Bitwise AND
            OR:  result = A | B;                            // Bitwise OR
            XOR: result = A ^ B;                            // Bitwise XOR
            NOT: result = ~A;                               // Bitwise NOT
            LSHIFT: result = A << 1;                        // Logical Shift Left
            RSHIFT: result = A >> 1;                        // Logical Shift Right
            LT: result = (A < B);                           // A < B (Comparison)
            EQ: result = (A == B);                          // A == B (Comparison)
            INC: begin
                temp = A + 1;
                result = temp[7:0];
                carry = temp[8];                            // Capture carry for overflow
            end
            DEC: begin
                temp = A - 1;
                result = temp[7:0];
                carry = (A == 0);                           // Carry if decrement causes underflow
            end
            MUL: begin                                      // Multiplication
                temp = A * B;
                result = temp[7:0];                         // Only lower 8 bits used
                carry = temp[15:8] != 0;                    // Set carry if multiplication result exceeds 8 bits
            end
            DIV: begin                                      // Division
                if (B != 0) begin
                    result = A / B;                         // Division (integer result)
                    carry = 0;                              // No carry in division
                end else begin
                    result = 8'b00000000;                   // Division by zero case
                    carry = 1;                              // Set carry flag for error
                end
            end
            default: result = 8'b00000000;                  // Default to 0 if no match
        endcase

                                                            // Set Zero flag if result is 0
        zero = (result == 8'b00000000);

                                                            // Set Sign flag (1 for negative result)
        sign = result[7];
    end
endmodule

