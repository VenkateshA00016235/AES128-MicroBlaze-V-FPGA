#include <stdint.h>

#include "aes_sw.h"
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

    uint32_t sw_cycles;
    uint64_t sw_latency_ns;
    uint64_t sw_throughput_kbps;

    xil_printf("\r\n");
    
    xil_printf("        AES-128 Software Test\r\n");
    

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

        sw_latency_ns =
            ((uint64_t)sw_cycles * 1000000000ULL) /
            TIMER_FREQ_HZ;

        sw_throughput_kbps =
            (AES_BLOCK_BITS * TIMER_FREQ_HZ) /
            ((uint64_t)sw_cycles * 1000ULL);

        uart_print_block(
            "\r\nSoftware Ciphertext = ",
            ciphertext
        );

        xil_printf("\r\nPerformance Results:  \r\n");
        

        xil_printf(
            "Software cycles       = %u\r\n",
            sw_cycles
        );

        xil_printf(
            "Software latency      = %u.%03u us\r\n",
            (uint32_t)(sw_latency_ns / 1000ULL),
            (uint32_t)(sw_latency_ns % 1000ULL)
        );

        xil_printf(
            "Software throughput   = %u.%03u Mbps\r\n",
            (uint32_t)(sw_throughput_kbps / 1000ULL),
            (uint32_t)(sw_throughput_kbps % 1000ULL)
        );

        xil_printf("          END                  \r\n");
    }

    return 0;
}