#include <stdint.h>

#include "aes_hw.h"
#include "uart_utils.h"
#include "timer_utils.h"
#include "xil_printf.h"

#define TIMER_FREQ_HZ   100000000ULL
#define AES_BLOCK_BITS  128ULL

int main(void)
{
    uint8_t plaintext[AES_BLOCK_SIZE];
    uint8_t key[AES_BLOCK_SIZE];
    uint8_t ciphertext[AES_BLOCK_SIZE];

    uint32_t hw_cycles;
    uint64_t hw_latency_ns;
    uint64_t hw_throughput_kbps;

    xil_printf("\r\n");
    
    xil_printf("        AES-128 Hardware Test\r\n");
    

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

        hw_latency_ns =
            ((uint64_t)hw_cycles * 1000000000ULL) /
            TIMER_FREQ_HZ;

        hw_throughput_kbps =
            (AES_BLOCK_BITS * TIMER_FREQ_HZ) /
            ((uint64_t)hw_cycles * 1000ULL);

        uart_print_block(
            "\r\nHardware Ciphertext = ",
            ciphertext
        );

        xil_printf("\r\nPerformance Results :\r\n");
        

        xil_printf(
            "Hardware cycles       = %u\r\n",
            hw_cycles
        );

        xil_printf(
            "Hardware latency      = %u.%03u us\r\n",
            (uint32_t)(hw_latency_ns / 1000ULL),
            (uint32_t)(hw_latency_ns % 1000ULL)
        );

        xil_printf(
            "Hardware throughput   = %u.%03u Mbps\r\n",
            (uint32_t)(hw_throughput_kbps / 1000ULL),
            (uint32_t)(hw_throughput_kbps % 1000ULL)
        );

        xil_printf("        END               \r\n");
    }

    return 0;
}