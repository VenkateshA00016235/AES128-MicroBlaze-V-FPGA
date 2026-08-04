`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 23:18:02
// Design Name: 
// Module Name: aes_subbytes
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


module aes_subbytes (
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

    aes_sbox sbox0 (
        .data_in  (state_in[127:120]),
        .data_out (state_out[127:120])
    );

    aes_sbox sbox1 (
        .data_in  (state_in[119:112]),
        .data_out (state_out[119:112])
    );

    aes_sbox sbox2 (
        .data_in  (state_in[111:104]),
        .data_out (state_out[111:104])
    );

    aes_sbox sbox3 (
        .data_in  (state_in[103:96]),
        .data_out (state_out[103:96])
    );

    aes_sbox sbox4 (
        .data_in  (state_in[95:88]),
        .data_out (state_out[95:88])
    );

    aes_sbox sbox5 (
        .data_in  (state_in[87:80]),
        .data_out (state_out[87:80])
    );

    aes_sbox sbox6 (
        .data_in  (state_in[79:72]),
        .data_out (state_out[79:72])
    );

    aes_sbox sbox7 (
        .data_in  (state_in[71:64]),
        .data_out (state_out[71:64])
    );

    aes_sbox sbox8 (
        .data_in  (state_in[63:56]),
        .data_out (state_out[63:56])
    );

    aes_sbox sbox9 (
        .data_in  (state_in[55:48]),
        .data_out (state_out[55:48])
    );

    aes_sbox sbox10 (
        .data_in  (state_in[47:40]),
        .data_out (state_out[47:40])
    );

    aes_sbox sbox11 (
        .data_in  (state_in[39:32]),
        .data_out (state_out[39:32])
    );

    aes_sbox sbox12 (
        .data_in  (state_in[31:24]),
        .data_out (state_out[31:24])
    );

    aes_sbox sbox13 (
        .data_in  (state_in[23:16]),
        .data_out (state_out[23:16])
    );

    aes_sbox sbox14 (
        .data_in  (state_in[15:8]),
        .data_out (state_out[15:8])
    );

    aes_sbox sbox15 (
        .data_in  (state_in[7:0]),
        .data_out (state_out[7:0])
    );

endmodule
