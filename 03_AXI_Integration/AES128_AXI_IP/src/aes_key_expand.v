`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 22:42:31
// Design Name: 
// Module Name: aes_key_expand
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


module aes_key_expand (
    input  wire [127:0] key_in,
    output wire [1407:0] round_keys
);

    // AES-128 round constants
    localparam [31:0] RCON0 = 32'h01000000;
    localparam [31:0] RCON1 = 32'h02000000;
    localparam [31:0] RCON2 = 32'h04000000;
    localparam [31:0] RCON3 = 32'h08000000;
    localparam [31:0] RCON4 = 32'h10000000;
    localparam [31:0] RCON5 = 32'h20000000;
    localparam [31:0] RCON6 = 32'h40000000;
    localparam [31:0] RCON7 = 32'h80000000;
    localparam [31:0] RCON8 = 32'h1B000000;
    localparam [31:0] RCON9 = 32'h36000000;


    // Rotates a 32-bit word one byte to the left
    function [31:0] rot_word;

        input [31:0] word_in;

        begin
            rot_word = {
                word_in[23:0],
                word_in[31:24]
            };
        end

    endfunction


    // AES key schedule words
    wire [31:0] w0;
    wire [31:0] w1;
    wire [31:0] w2;
    wire [31:0] w3;

    wire [31:0] w4;
    wire [31:0] w5;
    wire [31:0] w6;
    wire [31:0] w7;

    wire [31:0] w8;
    wire [31:0] w9;
    wire [31:0] w10;
    wire [31:0] w11;

    wire [31:0] w12;
    wire [31:0] w13;
    wire [31:0] w14;
    wire [31:0] w15;

    wire [31:0] w16;
    wire [31:0] w17;
    wire [31:0] w18;
    wire [31:0] w19;

    wire [31:0] w20;
    wire [31:0] w21;
    wire [31:0] w22;
    wire [31:0] w23;

    wire [31:0] w24;
    wire [31:0] w25;
    wire [31:0] w26;
    wire [31:0] w27;

    wire [31:0] w28;
    wire [31:0] w29;
    wire [31:0] w30;
    wire [31:0] w31;

    wire [31:0] w32;
    wire [31:0] w33;
    wire [31:0] w34;
    wire [31:0] w35;

    wire [31:0] w36;
    wire [31:0] w37;
    wire [31:0] w38;
    wire [31:0] w39;

    wire [31:0] w40;
    wire [31:0] w41;
    wire [31:0] w42;
    wire [31:0] w43;


    // SubWord results
    wire [31:0] subword0;
    wire [31:0] subword1;
    wire [31:0] subword2;
    wire [31:0] subword3;
    wire [31:0] subword4;
    wire [31:0] subword5;
    wire [31:0] subword6;
    wire [31:0] subword7;
    wire [31:0] subword8;
    wire [31:0] subword9;


    // Original AES-128 key
    assign w0 = key_in[127:96];
    assign w1 = key_in[95:64];
    assign w2 = key_in[63:32];
    assign w3 = key_in[31:0];


    // SubWord for round 1
    aes_subword subword_round1 (
        .word_in  (rot_word(w3)),
        .word_out (subword0)
    );

    assign w4 = w0 ^ subword0 ^ RCON0;
    assign w5 = w1 ^ w4;
    assign w6 = w2 ^ w5;
    assign w7 = w3 ^ w6;


    // SubWord for round 2
    aes_subword subword_round2 (
        .word_in  (rot_word(w7)),
        .word_out (subword1)
    );

    assign w8  = w4 ^ subword1 ^ RCON1;
    assign w9  = w5 ^ w8;
    assign w10 = w6 ^ w9;
    assign w11 = w7 ^ w10;


    // SubWord for round 3
    aes_subword subword_round3 (
        .word_in  (rot_word(w11)),
        .word_out (subword2)
    );

    assign w12 = w8  ^ subword2 ^ RCON2;
    assign w13 = w9  ^ w12;
    assign w14 = w10 ^ w13;
    assign w15 = w11 ^ w14;


    // SubWord for round 4
    aes_subword subword_round4 (
        .word_in  (rot_word(w15)),
        .word_out (subword3)
    );

    assign w16 = w12 ^ subword3 ^ RCON3;
    assign w17 = w13 ^ w16;
    assign w18 = w14 ^ w17;
    assign w19 = w15 ^ w18;


    // SubWord for round 5
    aes_subword subword_round5 (
        .word_in  (rot_word(w19)),
        .word_out (subword4)
    );

    assign w20 = w16 ^ subword4 ^ RCON4;
    assign w21 = w17 ^ w20;
    assign w22 = w18 ^ w21;
    assign w23 = w19 ^ w22;


    // SubWord for round 6
    aes_subword subword_round6 (
        .word_in  (rot_word(w23)),
        .word_out (subword5)
    );

    assign w24 = w20 ^ subword5 ^ RCON5;
    assign w25 = w21 ^ w24;
    assign w26 = w22 ^ w25;
    assign w27 = w23 ^ w26;


    // SubWord for round 7
    aes_subword subword_round7 (
        .word_in  (rot_word(w27)),
        .word_out (subword6)
    );

    assign w28 = w24 ^ subword6 ^ RCON6;
    assign w29 = w25 ^ w28;
    assign w30 = w26 ^ w29;
    assign w31 = w27 ^ w30;


    // SubWord for round 8
    aes_subword subword_round8 (
        .word_in  (rot_word(w31)),
        .word_out (subword7)
    );

    assign w32 = w28 ^ subword7 ^ RCON7;
    assign w33 = w29 ^ w32;
    assign w34 = w30 ^ w33;
    assign w35 = w31 ^ w34;


    // SubWord for round 9
    aes_subword subword_round9 (
        .word_in  (rot_word(w35)),
        .word_out (subword8)
    );

    assign w36 = w32 ^ subword8 ^ RCON8;
    assign w37 = w33 ^ w36;
    assign w38 = w34 ^ w37;
    assign w39 = w35 ^ w38;


    // SubWord for round 10
    aes_subword subword_round10 (
        .word_in  (rot_word(w39)),
        .word_out (subword9)
    );

    assign w40 = w36 ^ subword9 ^ RCON9;
    assign w41 = w37 ^ w40;
    assign w42 = w38 ^ w41;
    assign w43 = w39 ^ w42;


    // All eleven AES-128 round keys
    assign round_keys = {
        w0,  w1,  w2,  w3,
        w4,  w5,  w6,  w7,
        w8,  w9,  w10, w11,
        w12, w13, w14, w15,
        w16, w17, w18, w19,
        w20, w21, w22, w23,
        w24, w25, w26, w27,
        w28, w29, w30, w31,
        w32, w33, w34, w35,
        w36, w37, w38, w39,
        w40, w41, w42, w43
    };

endmodule


module aes_subword (
    input  wire [31:0] word_in,
    output wire [31:0] word_out
);

    aes_sbox sbox0 (
        .data_in  (word_in[31:24]),
        .data_out (word_out[31:24])
    );

    aes_sbox sbox1 (
        .data_in  (word_in[23:16]),
        .data_out (word_out[23:16])
    );

    aes_sbox sbox2 (
        .data_in  (word_in[15:8]),
        .data_out (word_out[15:8])
    );

    aes_sbox sbox3 (
        .data_in  (word_in[7:0]),
        .data_out (word_out[7:0])
    );

endmodule
