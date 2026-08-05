#include <string.h>
#include "aes_hw.h"
#include "aes_sw.h"
#include "uart_utils.h"

#include "xil_printf.h"

#include <stdint.h>

int main(void)
{
    uint8_t plaintext[AES_BLOCK_SIZE];
    uint8_t key[AES_BLOCK_SIZE];

    uint8_t hw_cipher[AES_BLOCK_SIZE];
    uint8_t sw_cipher[AES_BLOCK_SIZE];

    xil_printf("\r\n");
    xil_printf("=========================================\r\n");
    xil_printf("     AES-128 HW/SW Comparison\r\n");
    xil_printf("=========================================\r\n");

    while (1)
    {

    uart_read_hex_block(
        "\r\nEnter Plaintext (32 hex chars): ",
        plaintext
    );

    uart_read_hex_block(
        "Enter Key       (32 hex chars): ",
        key
    );

    aes_hw_encrypt(
        plaintext,
        key,
        hw_cipher
    );

    aes_sw_encrypt(
        plaintext,
        key,
        sw_cipher
    );

    uart_print_block(
        "\r\nHardware Ciphertext = ",
        hw_cipher
    );

    uart_print_block(
        "Software Ciphertext = ",
        sw_cipher
    );

if (memcmp(hw_cipher, sw_cipher, AES_BLOCK_SIZE) == 0)
{
    xil_printf("Verification          = MATCH\r\n");
}
else
{
    xil_printf("Verification          = MISMATCH\r\n");
}
   
   
    xil_printf("-----------------------------------------\r\n");


    }

    return 0;
}