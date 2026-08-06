#ifndef PLATFORM_H
#define PLATFORM_H

/* AES AXI Base Address */
#define AES_BASEADDR        0x80000000U

/* Plaintext Registers */
#define AES_PTEXT0_OFFSET   0x00U
#define AES_PTEXT1_OFFSET   0x04U
#define AES_PTEXT2_OFFSET   0x08U
#define AES_PTEXT3_OFFSET   0x0CU

/* Key Registers */
#define AES_KEY0_OFFSET     0x10U
#define AES_KEY1_OFFSET     0x14U
#define AES_KEY2_OFFSET     0x18U
#define AES_KEY3_OFFSET     0x1CU

/* Ciphertext Registers */
#define AES_CTEXT0_OFFSET   0x20U
#define AES_CTEXT1_OFFSET   0x24U
#define AES_CTEXT2_OFFSET   0x28U
#define AES_CTEXT3_OFFSET   0x2CU

/* Control / Status */
#define AES_CONTROL_OFFSET  0x30U
#define AES_STATUS_OFFSET   0x34U

#endif