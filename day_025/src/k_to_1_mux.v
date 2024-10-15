
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/16/2024 07:00:13 AM
// Module Name: k_to_1_mux
//////////////////////////////////////////////////////////////////////////////////


//module k_to_1_mux 
//#(parameter N = 64)(
//input [N-1:0]a,
//input [6:0] sel,
//output y
//    );
//    assign y = a[sel];
//endmodule


//module k_to_1_mux 
//#(parameter N = 64)(
//input [N-1:0] a,  // 64-bit input
//input [5:0] sel,  // 6-bit select line
//output reg y      // output
//    );
    
//    always @(*) begin
//        case(sel)
//            6'd0:  y = a[0];
//            6'd1:  y = a[1];
//            6'd2:  y = a[2];
//            6'd3:  y = a[3];
//            6'd4:  y = a[4];
//            6'd5:  y = a[5];
//            6'd6:  y = a[6];
//            6'd7:  y = a[7];
//            6'd8:  y = a[8];
//            6'd9:  y = a[9];
//            6'd10: y = a[10];
//            6'd11: y = a[11];
//            6'd12: y = a[12];
//            6'd13: y = a[13];
//            6'd14: y = a[14];
//            6'd15: y = a[15];
//            6'd16: y = a[16];
//            6'd17: y = a[17];
//            6'd18: y = a[18];
//            6'd19: y = a[19];
//            6'd20: y = a[20];
//            6'd21: y = a[21];
//            6'd22: y = a[22];
//            6'd23: y = a[23];
//            6'd24: y = a[24];
//            6'd25: y = a[25];
//            6'd26: y = a[26];
//            6'd27: y = a[27];
//            6'd28: y = a[28];
//            6'd29: y = a[29];
//            6'd30: y = a[30];
//            6'd31: y = a[31];
//            6'd32: y = a[32];
//            6'd33: y = a[33];
//            6'd34: y = a[34];
//            6'd35: y = a[35];
//            6'd36: y = a[36];
//            6'd37: y = a[37];
//            6'd38: y = a[38];
//            6'd39: y = a[39];
//            6'd40: y = a[40];
//            6'd41: y = a[41];
//            6'd42: y = a[42];
//            6'd43: y = a[43];
//            6'd44: y = a[44];
//            6'd45: y = a[45];
//            6'd46: y = a[46];
//            6'd47: y = a[47];
//            6'd48: y = a[48];
//            6'd49: y = a[49];
//            6'd50: y = a[50];
//            6'd51: y = a[51];
//            6'd52: y = a[52];
//            6'd53: y = a[53];
//            6'd54: y = a[54];
//            6'd55: y = a[55];
//            6'd56: y = a[56];
//            6'd57: y = a[57];
//            6'd58: y = a[58];
//            6'd59: y = a[59];
//            6'd60: y = a[60];
//            6'd61: y = a[61];
//            6'd62: y = a[62];
//            6'd63: y = a[63];
//            default: y = 1'b0; // Default case
//        endcase
//    end
    
//endmodule








/*      16 x 16 Register File       */


//module k_to_1_mux (
////module register_file (
//    input clk,                // Clock signal
//    input we,                 // Write enable signal
//    input [3:0] read_addr1,    // Address of the first register to read
//    input [3:0] read_addr2,    // Address of the second register to read
//    input [3:0] write_addr,    // Address of the register to write to
//    input [15:0] write_data,   // Data to write to the register
//    output [15:0] read_data1,  // Data read from the first register
//    output [15:0] read_data2   // Data read from the second register
//);

//    reg [15:0] reg_file [15:0];  // 16 registers, each 16 bits wide

//    // Read operation (asynchronous)
//    assign read_data1 = reg_file[read_addr1];
//    assign read_data2 = reg_file[read_addr2];

//    // Write operation (synchronous)
//    always @(posedge clk) begin
//        if (we) begin
//            reg_file[write_addr] <= write_data;  // Write data to the specified register
//        end
//    end

//endmodule

/*    Cache Memory (Direct Mapping)      */


//module direct_mapped_cache #(
module k_to_1_mux #(
    parameter DATA_WIDTH = 32,   // Data width (32-bit)
    parameter ADDR_WIDTH = 8,    // Address width (8-bit)
    parameter CACHE_SIZE = 16    // Cache size in terms of number of blocks (16 blocks)
)(
    input clk,                   // Clock signal
    input rst,                   // Reset signal
    input [ADDR_WIDTH-1:0] address, // Address from CPU
    input [DATA_WIDTH-1:0] write_data, // Data to be written
    input mem_write,             // Memory write signal
    input mem_read,              // Memory read signal
    output reg [DATA_WIDTH-1:0] read_data, // Data to CPU
    output reg hit               // Cache hit signal
);

    // Cache line structure
    reg [DATA_WIDTH-1:0] cache_data [CACHE_SIZE-1:0];   // Cache memory for storing data
    reg [ADDR_WIDTH-ADDR_WIDTH/2-1:0] tag_array [CACHE_SIZE-1:0]; // Tag array
    reg valid_array [CACHE_SIZE-1:0];                  // Valid bits

    wire [ADDR_WIDTH/2-1:0] index; // Cache index
    wire [ADDR_WIDTH-ADDR_WIDTH/2-1:0] tag; // Tag for comparison

    // Split address into index and tag
    assign index = address[ADDR_WIDTH/2-1:0];
    assign tag = address[ADDR_WIDTH-1:ADDR_WIDTH/2];

    // Reset logic
    integer i;
    always @(posedge rst) begin
        if (rst) begin
            for (i = 0; i < CACHE_SIZE; i = i + 1) begin
                valid_array[i] <= 0;
            end
        end
    end

    // Cache read/write logic
    always @(posedge clk) begin
        if (mem_read) begin
            // Check if the tag matches and the block is valid
            if (valid_array[index] && (tag_array[index] == tag)) begin
                read_data <= cache_data[index]; // Cache hit
                hit <= 1;
            end else begin
                read_data <= 0; // Cache miss
                hit <= 0;
            end
        end
        
        if (mem_write) begin
            // Write data into cache, update tag and valid bit
            cache_data[index] <= write_data;
            tag_array[index] <= tag;
            valid_array[index] <= 1;
        end
    end

endmodule
