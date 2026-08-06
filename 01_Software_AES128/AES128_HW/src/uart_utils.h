#ifndef UART_UTILS_H
#define UART_UTILS_H

#include <stdint.h>

#define AES_HEX_CHARS 32
#define AES_BLOCK_SIZE 16

void uart_read_hex_block(
    const char *prompt,
    uint8_t output[AES_BLOCK_SIZE]
);

void uart_print_block(
    const char *label,
    const uint8_t block[AES_BLOCK_SIZE]
);

#endif