`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 23:12:43
// Design Name: 
// Module Name: aes_encrypt_core
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


module aes_encrypt_core(

    input  wire [127:0] plaintext,
    input  wire [127:0] key,
    output wire [127:0] ciphertext

    );
    
    wire [1407:0] round_keys;

    aes_key_expand key_expansion (
        .key_in     (key),
        .round_keys (round_keys)
    );
    
        wire [127:0] round0_state;

        aes_addroundkey initial_addroundkey (
        .state_in  (plaintext),
        .round_key (round_keys[1407:1280]),
        .state_out (round0_state)
    );
    
        wire [127:0] round1_subbytes;

        aes_subbytes round1_subbytes_stage (
        .state_in  (round0_state),
        .state_out (round1_subbytes)
    );
    
        wire [127:0] round1_shiftrows;

        aes_shiftrows round1_shiftrows_stage (
        .state_in  (round1_subbytes),
        .state_out (round1_shiftrows)
    );
        wire [127:0] round1_mixcolumns;

        aes_mixcolumns round1_mixcolumns_stage (
        .state_in  (round1_shiftrows),
        .state_out (round1_mixcolumns)
    );
    
        wire [127:0] round1_state;

        aes_addroundkey round1_addroundkey_stage (
        .state_in  (round1_mixcolumns),
        .round_key (round_keys[1279:1152]),
        .state_out (round1_state)
    );
    
    //Round 2
        wire [127:0] round2_subbytes;
        wire [127:0] round2_shiftrows;
        wire [127:0] round2_mixcolumns;
        wire [127:0] round2_state;

    aes_subbytes round2_subbytes_stage (
        .state_in  (round1_state),
        .state_out (round2_subbytes)
    );

    aes_shiftrows round2_shiftrows_stage (
        .state_in  (round2_subbytes),
        .state_out (round2_shiftrows)
    );

    aes_mixcolumns round2_mixcolumns_stage (
        .state_in  (round2_shiftrows),
        .state_out (round2_mixcolumns)
    );

    aes_addroundkey round2_addroundkey_stage (
        .state_in  (round2_mixcolumns),
        .round_key (round_keys[1151:1024]),
        .state_out (round2_state)
    );
    
    //Round 3
        wire [127:0] round3_subbytes;
        wire [127:0] round3_shiftrows;
        wire [127:0] round3_mixcolumns;
        wire [127:0] round3_state;

    aes_subbytes round3_subbytes_stage (
        .state_in  (round2_state),
        .state_out (round3_subbytes)
    );

    aes_shiftrows round3_shiftrows_stage (
        .state_in  (round3_subbytes),
        .state_out (round3_shiftrows)
    );

    aes_mixcolumns round3_mixcolumns_stage (
        .state_in  (round3_shiftrows),
        .state_out (round3_mixcolumns)
    );

    aes_addroundkey round3_addroundkey_stage (
        .state_in  (round3_mixcolumns),
        .round_key (round_keys[1023:896]),
        .state_out (round3_state)
    );
    
    //Round 4
        wire [127:0] round4_subbytes;
        wire [127:0] round4_shiftrows;
        wire [127:0] round4_mixcolumns;
        wire [127:0] round4_state;

    aes_subbytes round4_subbytes_stage (
        .state_in  (round3_state),
        .state_out (round4_subbytes)
    );

    aes_shiftrows round4_shiftrows_stage (
        .state_in  (round4_subbytes),
        .state_out (round4_shiftrows)
    );

    aes_mixcolumns round4_mixcolumns_stage (
        .state_in  (round4_shiftrows),
        .state_out (round4_mixcolumns)
    );

    aes_addroundkey round4_addroundkey_stage (
        .state_in  (round4_mixcolumns),
        .round_key (round_keys[895:768]),
        .state_out (round4_state)
    );
    
        // Round 5
    wire [127:0] round5_subbytes;
    wire [127:0] round5_shiftrows;
    wire [127:0] round5_mixcolumns;
    wire [127:0] round5_state;

    aes_subbytes round5_subbytes_stage (
        .state_in  (round4_state),
        .state_out (round5_subbytes)
    );

    aes_shiftrows round5_shiftrows_stage (
        .state_in  (round5_subbytes),
        .state_out (round5_shiftrows)
    );

    aes_mixcolumns round5_mixcolumns_stage (
        .state_in  (round5_shiftrows),
        .state_out (round5_mixcolumns)
    );

    aes_addroundkey round5_addroundkey_stage (
        .state_in  (round5_mixcolumns),
        .round_key (round_keys[767:640]),
        .state_out (round5_state)
    );


    // Round 6
    wire [127:0] round6_subbytes;
    wire [127:0] round6_shiftrows;
    wire [127:0] round6_mixcolumns;
    wire [127:0] round6_state;

    aes_subbytes round6_subbytes_stage (
        .state_in  (round5_state),
        .state_out (round6_subbytes)
    );

    aes_shiftrows round6_shiftrows_stage (
        .state_in  (round6_subbytes),
        .state_out (round6_shiftrows)
    );

    aes_mixcolumns round6_mixcolumns_stage (
        .state_in  (round6_shiftrows),
        .state_out (round6_mixcolumns)
    );

    aes_addroundkey round6_addroundkey_stage (
        .state_in  (round6_mixcolumns),
        .round_key (round_keys[639:512]),
        .state_out (round6_state)
    );


    // Round 7
    wire [127:0] round7_subbytes;
    wire [127:0] round7_shiftrows;
    wire [127:0] round7_mixcolumns;
    wire [127:0] round7_state;

    aes_subbytes round7_subbytes_stage (
        .state_in  (round6_state),
        .state_out (round7_subbytes)
    );

    aes_shiftrows round7_shiftrows_stage (
        .state_in  (round7_subbytes),
        .state_out (round7_shiftrows)
    );

    aes_mixcolumns round7_mixcolumns_stage (
        .state_in  (round7_shiftrows),
        .state_out (round7_mixcolumns)
    );

    aes_addroundkey round7_addroundkey_stage (
        .state_in  (round7_mixcolumns),
        .round_key (round_keys[511:384]),
        .state_out (round7_state)
    );


    // Round 8
    wire [127:0] round8_subbytes;
    wire [127:0] round8_shiftrows;
    wire [127:0] round8_mixcolumns;
    wire [127:0] round8_state;

    aes_subbytes round8_subbytes_stage (
        .state_in  (round7_state),
        .state_out (round8_subbytes)
    );

    aes_shiftrows round8_shiftrows_stage (
        .state_in  (round8_subbytes),
        .state_out (round8_shiftrows)
    );

    aes_mixcolumns round8_mixcolumns_stage (
        .state_in  (round8_shiftrows),
        .state_out (round8_mixcolumns)
    );

    aes_addroundkey round8_addroundkey_stage (
        .state_in  (round8_mixcolumns),
        .round_key (round_keys[383:256]),
        .state_out (round8_state)
    );


    // Round 9
    wire [127:0] round9_subbytes;
    wire [127:0] round9_shiftrows;
    wire [127:0] round9_mixcolumns;
    wire [127:0] round9_state;

    aes_subbytes round9_subbytes_stage (
        .state_in  (round8_state),
        .state_out (round9_subbytes)
    );

    aes_shiftrows round9_shiftrows_stage (
        .state_in  (round9_subbytes),
        .state_out (round9_shiftrows)
    );

    aes_mixcolumns round9_mixcolumns_stage (
        .state_in  (round9_shiftrows),
        .state_out (round9_mixcolumns)
    );

    aes_addroundkey round9_addroundkey_stage (
        .state_in  (round9_mixcolumns),
        .round_key (round_keys[255:128]),
        .state_out (round9_state)
    );


    // Round 10
    // The final round does not use MixColumns
    wire [127:0] round10_subbytes;
    wire [127:0] round10_shiftrows;
    wire [127:0] round10_state;

    aes_subbytes round10_subbytes_stage (
        .state_in  (round9_state),
        .state_out (round10_subbytes)
    );

    aes_shiftrows round10_shiftrows_stage (
        .state_in  (round10_subbytes),
        .state_out (round10_shiftrows)
    );

    aes_addroundkey round10_addroundkey_stage (
        .state_in  (round10_shiftrows),
        .round_key (round_keys[127:0]),
        .state_out (round10_state)
    );

    assign ciphertext = round10_state;
endmodule
