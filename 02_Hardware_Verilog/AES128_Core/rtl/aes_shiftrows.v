`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 22:17:34
// Design Name: 
// Module Name: aes_shiftrows
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


module aes_shiftrows(

input  wire [127:0] state_in,
    output wire [127:0] state_out
);

    /*
     * ShiftRows:
     * Row 0: no shift
     * Row 1: shift left by 1 byte
     * Row 2: shift left by 2 bytes
     * Row 3: shift left by 3 bytes
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

    assign state_out = {
        b0,  b5,  b10, b15,
        b4,  b9,  b14, b3,
        b8,  b13, b2,  b7,
        b12, b1,  b6,  b11
    };


    
endmodule
