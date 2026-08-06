#include <string.h>
#include "aes_hw.h"
#include "aes_sw.h"
#include "uart_utils.h"
#include "timer_utils.h"

#include "xil_printf.h"

#include <stdint.h>

int main(void)
{
    uint8_t plaintext[AES_BLOCK_SIZE];
    uint8_t key[AES_BLOCK_SIZE];

    uint8_t hw_cipher[AES_BLOCK_SIZE];
    uint8_t sw_cipher[AES_BLOCK_SIZE];

    uint32_t hw_cycles;
    uint32_t sw_cycles;

    

    xil_printf("\r\n");
    
    xil_printf("     AES-128 HW/SW Comparison\r\n");
    

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
    hw_cipher
    );

    hw_cycles = timer_stop();

    timer_start();

    aes_sw_encrypt(
    plaintext,
    key,
    sw_cipher
    );

    sw_cycles = timer_stop();

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


xil_printf("Hardware cycles       = %u\r\n", hw_cycles);
xil_printf("Software cycles       = %u\r\n", sw_cycles);

if (hw_cycles != 0U)
{
    uint32_t speedup_x100;

    speedup_x100 = (sw_cycles * 100U) / hw_cycles;

    xil_printf("Speedup               = %u.%02ux\r\n",
               speedup_x100 / 100U,
               speedup_x100 % 100U);
 }

xil_printf("                   END                            \r\n");


    }

    return 0;
}