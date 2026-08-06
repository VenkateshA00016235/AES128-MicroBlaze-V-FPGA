#include <stdint.h>

#include "aes_hw.h"
#include "uart_utils.h"
#include "timer_utils.h"
#include "xil_printf.h"

int main(void)
{
    uint8_t plaintext[AES_BLOCK_SIZE];
    uint8_t key[AES_BLOCK_SIZE];
    uint8_t ciphertext[AES_BLOCK_SIZE];

    uint32_t hw_cycles;

    xil_printf("\r\n");
    
    xil_printf("        AES-128 Hardware Test         \r\n");
    

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

        aes_hw_encrypt(
            plaintext,
            key,
            ciphertext
        );

        hw_cycles = timer_stop();

        uart_print_block(
            "\r\nHardware Ciphertext = ",
            ciphertext
        );

        xil_printf(
            "Hardware cycles       = %u\r\n",
            hw_cycles
        );

        xil_printf("  END  \r\n");
    }

    return 0;
}