#include <stdint.h>

#include "aes_sw.h"
#include "uart_utils.h"
#include "timer_utils.h"
#include "xil_printf.h"

int main(void)
{
    uint8_t plaintext[AES_BLOCK_SIZE];
    uint8_t key[AES_BLOCK_SIZE];
    uint8_t ciphertext[AES_BLOCK_SIZE];

    uint32_t sw_cycles;

    xil_printf("\r\n");
    xil_printf("   AES-128 Software Test   \r\n");

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

        timer_start();

        aes_sw_encrypt(
            plaintext,
            key,
            ciphertext
        );

        sw_cycles = timer_stop();

        uart_print_block(
            "\r\nSoftware Ciphertext = ",
            ciphertext
        );

        xil_printf(
            "Software cycles       = %u\r\n",
            sw_cycles
        );

        xil_printf("     END     \r\n");
    }

    return 0;
}