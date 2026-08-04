`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 23:28:40
// Design Name: 
// Module Name: aes_encrypt_core_tb
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

module tb_aes_encrypt_core;

    reg  [127:0] plaintext;
    reg  [127:0] key;
    wire [127:0] ciphertext;

    localparam [127:0] EXPECTED_CIPHERTEXT =
        128'h69c4e0d86a7b0430d8cdb78070b4c55a;

    aes_encrypt_core dut (
        .plaintext  (plaintext),
        .key        (key),
        .ciphertext (ciphertext)
    );

    initial begin
        plaintext = 128'h00112233445566778899aabbccddeeff;
        key       = 128'h000102030405060708090a0b0c0d0e0f;

        #10;

        $display("Plaintext  = %032h", plaintext);
        $display("Key        = %032h", key);
        $display("Ciphertext = %032h", ciphertext);
        $display("Expected   = %032h", EXPECTED_CIPHERTEXT);

        if (ciphertext === EXPECTED_CIPHERTEXT)
            $display("AES-128 TEST PASSED");
        else
            $display("AES-128 TEST FAILED");

        #10;
        $finish;
    end

endmodule