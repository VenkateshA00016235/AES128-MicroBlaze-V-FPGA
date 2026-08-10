#include <stdint.h>
#include <string.h>

#include "aes_hw.h"
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

    uint8_t hw_cipher[AES_BLOCK_SIZE];
    uint8_t sw_cipher[AES_BLOCK_SIZE];

    uint32_t hw_cycles;
    uint32_t sw_cycles;
    uint32_t speedup_x100;

    uint64_t hw_latency_ns;
    uint64_t sw_latency_ns;

    uint64_t hw_throughput_kbps;
    uint64_t sw_throughput_kbps;

    xil_printf("\r\n");
    
    xil_printf("     AES-128 HW/SW Comparison          \r\n");
    

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

        /*
          Measure complete hardware path:
          AXI writes, encryption, status polling and AXI reads.
         */
        timer_start();

        aes_hw_encrypt(
            plaintext,
            key,
            hw_cipher
        );

        hw_cycles = timer_stop();

        /* Measure software AES execution. */
        timer_start();

        aes_sw_encrypt(
            plaintext,
            key,
            sw_cipher
        );

        sw_cycles = timer_stop();

        /*
          Latency in nanoseconds.
          At 100 MHz, one timer cycle equals 10 ns.
         */
        hw_latency_ns =
            ((uint64_t)hw_cycles * 1000000000ULL) /
            TIMER_FREQ_HZ;

        sw_latency_ns =
            ((uint64_t)sw_cycles * 1000000000ULL) /
            TIMER_FREQ_HZ;

        /*
         * Throughput in kilobits per second:
         *
         * throughput =
         *     block_bits * timer_frequency / cycles
         *
         * Divide by 1000 to convert bits/s to kbit/s.
         */
        hw_throughput_kbps =
            (AES_BLOCK_BITS * TIMER_FREQ_HZ) /
            ((uint64_t)hw_cycles * 1000ULL);

        sw_throughput_kbps =
            (AES_BLOCK_BITS * TIMER_FREQ_HZ) /
            ((uint64_t)sw_cycles * 1000ULL);

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

        xil_printf("\r\nPerformance Results : \r\n");
        

        xil_printf(
            "Hardware cycles       = %u\r\n",
            hw_cycles
        );

        xil_printf(
            "Software cycles       = %u\r\n",
            sw_cycles
        );

        xil_printf(
            "Hardware latency      = %u.%03u us\r\n",
            (uint32_t)(hw_latency_ns / 1000ULL),
            (uint32_t)(hw_latency_ns % 1000ULL)
        );

        xil_printf(
            "Software latency      = %u.%03u us\r\n",
            (uint32_t)(sw_latency_ns / 1000ULL),
            (uint32_t)(sw_latency_ns % 1000ULL)
        );

        xil_printf(
            "Hardware throughput   = %u.%03u Mbps\r\n",
            (uint32_t)(hw_throughput_kbps / 1000ULL),
            (uint32_t)(hw_throughput_kbps % 1000ULL)
        );

        xil_printf(
            "Software throughput   = %u.%03u Mbps\r\n",
            (uint32_t)(sw_throughput_kbps / 1000ULL),
            (uint32_t)(sw_throughput_kbps % 1000ULL)
        );

        if (hw_cycles != 0U)
        {
            speedup_x100 =
                (uint32_t)(
                    ((uint64_t)sw_cycles * 100ULL) /
                    hw_cycles
                );

            xil_printf(
                "Speedup               = %u.%02ux\r\n",
                speedup_x100 / 100U,
                speedup_x100 % 100U
            );
        }
        else
        {
            xil_printf(
                "Speedup               = unavailable\r\n"
            );
        }

        xil_printf("         END           \r\n");
    }

    return 0;
}