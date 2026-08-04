`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 22:27:34
// Design Name: 
// Module Name: aes_mixcolumns
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aes_mixcolumns (
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

    /*
     * AES state is stored column by column:
     *
     * Column 0: b0,  b1,  b2,  b3
     * Column 1: b4,  b5,  b6,  b7
     * Column 2: b8,  b9,  b10, b11
     * Column 3: b12, b13, b14, b15
     */

    wire [7:0] b0;
    wire [7:0] b1;
    wire [7:0] b2;
    wire [7:0] b3;
    wire [7:0] b4;
    wire [7:0] b5;
    wire [7:0] b6;
    wire [7:0] b7;
    wire [7:0] b8;
    wire [7:0] b9;
    wire [7:0] b10;
    wire [7:0] b11;
    wire [7:0] b12;
    wire [7:0] b13;
    wire [7:0] b14;
    wire [7:0] b15;

    assign b0  = state_in[127:120];
    assign b1  = state_in[119:112];
    assign b2  = state_in[111:104];
    assign b3  = state_in[103:96];

    assign b4  = state_in[95:88];
    assign b5  = state_in[87:80];
    assign b6  = state_in[79:72];
    assign b7  = state_in[71:64];

    assign b8  = state_in[63:56];
    assign b9  = state_in[55:48];
    assign b10 = state_in[47:40];
    assign b11 = state_in[39:32];

    assign b12 = state_in[31:24];
    assign b13 = state_in[23:16];
    assign b14 = state_in[15:8];
    assign b15 = state_in[7:0];

    // Multiply one byte by 2 in GF(2^8)
    function [7:0] xtime;
        input [7:0] value;
        begin
            if (value[7] == 1'b1)
                xtime = (value << 1) ^ 8'h1B;
            else
                xtime = value << 1;
        end
    endfunction

    // Multiply one byte by 2
    function [7:0] mul2;
        input [7:0] value;
        begin
            mul2 = xtime(value);
        end
    endfunction

    // Multiply one byte by 3
    function [7:0] mul3;
        input [7:0] value;
        begin
            mul3 = xtime(value) ^ value;
        end
    endfunction

    // Mix column 0
    wire [7:0] c0_0;
    wire [7:0] c0_1;
    wire [7:0] c0_2;
    wire [7:0] c0_3;

    assign c0_0 = mul2(b0) ^ mul3(b1) ^ b2       ^ b3;
    assign c0_1 = b0       ^ mul2(b1) ^ mul3(b2) ^ b3;
    assign c0_2 = b0       ^ b1       ^ mul2(b2) ^ mul3(b3);
    assign c0_3 = mul3(b0) ^ b1       ^ b2       ^ mul2(b3);

    // Mix column 1
    wire [7:0] c1_0;
    wire [7:0] c1_1;
    wire [7:0] c1_2;
    wire [7:0] c1_3;

    assign c1_0 = mul2(b4) ^ mul3(b5) ^ b6       ^ b7;
    assign c1_1 = b4       ^ mul2(b5) ^ mul3(b6) ^ b7;
    assign c1_2 = b4       ^ b5       ^ mul2(b6) ^ mul3(b7);
    assign c1_3 = mul3(b4) ^ b5       ^ b6       ^ mul2(b7);

    // Mix column 2
    wire [7:0] c2_0;
    wire [7:0] c2_1;
    wire [7:0] c2_2;
    wire [7:0] c2_3;

    assign c2_0 = mul2(b8) ^ mul3(b9) ^ b10       ^ b11;
    assign c2_1 = b8       ^ mul2(b9) ^ mul3(b10) ^ b11;
    assign c2_2 = b8       ^ b9       ^ mul2(b10) ^ mul3(b11);
    assign c2_3 = mul3(b8) ^ b9       ^ b10       ^ mul2(b11);

    // Mix column 3
    wire [7:0] c3_0;
    wire [7:0] c3_1;
    wire [7:0] c3_2;
    wire [7:0] c3_3;

    assign c3_0 = mul2(b12) ^ mul3(b13) ^ b14       ^ b15;
    assign c3_1 = b12       ^ mul2(b13) ^ mul3(b14) ^ b15;
    assign c3_2 = b12       ^ b13       ^ mul2(b14) ^ mul3(b15);
    assign c3_3 = mul3(b12) ^ b13       ^ b14       ^ mul2(b15);

    assign state_out = {
        c0_0, c0_1, c0_2, c0_3,
        c1_0, c1_1, c1_2, c1_3,
        c2_0, c2_1, c2_2, c2_3,
        c3_0, c3_1, c3_2, c3_3
    };
    
endmodule
