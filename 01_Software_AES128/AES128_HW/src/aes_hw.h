#ifndef AES_HW_H
#define AES_HW_H

#include <stdint.h>

#define AES_BLOCK_SIZE 16

void aes_hw_encrypt(
    const uint8_t plaintext[AES_BLOCK_SIZE],
    const uint8_t key[AES_BLOCK_SIZE],
    uint8_t ciphertext[AES_BLOCK_SIZE]
);

#endif