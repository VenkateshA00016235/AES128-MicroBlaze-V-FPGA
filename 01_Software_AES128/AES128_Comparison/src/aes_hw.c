#include "aes_hw.h"
#include "platform.h"
#include "xil_io.h"

static uint32_t bytes_to_u32(const uint8_t bytes[4])
{
    return ((uint32_t)bytes[0] << 24) |
           ((uint32_t)bytes[1] << 16) |
           ((uint32_t)bytes[2] << 8)  |
           ((uint32_t)bytes[3]);
}

static void u32_to_bytes(uint32_t value, uint8_t bytes[4])
{
    bytes[0] = (uint8_t)(value >> 24);
    bytes[1] = (uint8_t)(value >> 16);
    bytes[2] = (uint8_t)(value >> 8);
    bytes[3] = (uint8_t)value;
}

void aes_hw_encrypt(
    const uint8_t plaintext[AES_BLOCK_SIZE],
    const uint8_t key[AES_BLOCK_SIZE],
    uint8_t ciphertext[AES_BLOCK_SIZE]
)
{
    uint32_t status;
    uint32_t word;

    Xil_Out32(AES_BASEADDR + AES_PTEXT0_OFFSET, bytes_to_u32(&plaintext[0]));
    Xil_Out32(AES_BASEADDR + AES_PTEXT1_OFFSET, bytes_to_u32(&plaintext[4]));
    Xil_Out32(AES_BASEADDR + AES_PTEXT2_OFFSET, bytes_to_u32(&plaintext[8]));
    Xil_Out32(AES_BASEADDR + AES_PTEXT3_OFFSET, bytes_to_u32(&plaintext[12]));

    Xil_Out32(AES_BASEADDR + AES_KEY0_OFFSET, bytes_to_u32(&key[0]));
    Xil_Out32(AES_BASEADDR + AES_KEY1_OFFSET, bytes_to_u32(&key[4]));
    Xil_Out32(AES_BASEADDR + AES_KEY2_OFFSET, bytes_to_u32(&key[8]));
    Xil_Out32(AES_BASEADDR + AES_KEY3_OFFSET, bytes_to_u32(&key[12]));

    Xil_Out32(AES_BASEADDR + AES_CONTROL_OFFSET, 0x00000001U);

    do {
        status = Xil_In32(AES_BASEADDR + AES_STATUS_OFFSET);
    } while ((status & 0x1U) == 0U);

    word = Xil_In32(AES_BASEADDR + AES_CTEXT0_OFFSET);
    u32_to_bytes(word, &ciphertext[0]);

    word = Xil_In32(AES_BASEADDR + AES_CTEXT1_OFFSET);
    u32_to_bytes(word, &ciphertext[4]);

    word = Xil_In32(AES_BASEADDR + AES_CTEXT2_OFFSET);
    u32_to_bytes(word, &ciphertext[8]);

    word = Xil_In32(AES_BASEADDR + AES_CTEXT3_OFFSET);
    u32_to_bytes(word, &ciphertext[12]);
}