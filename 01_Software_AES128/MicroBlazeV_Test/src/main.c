#include "xil_io.h"
#include "xil_printf.h"
#include "sleep.h"

#define AES_BASEADDR      0x80000000U

#define AES_PTEXT0_OFFSET 0x00U
#define AES_PTEXT1_OFFSET 0x04U
#define AES_PTEXT2_OFFSET 0x08U
#define AES_PTEXT3_OFFSET 0x0CU

#define AES_KEY0_OFFSET   0x10U
#define AES_KEY1_OFFSET   0x14U
#define AES_KEY2_OFFSET   0x18U
#define AES_KEY3_OFFSET   0x1CU

#define AES_CTEXT0_OFFSET 0x20U
#define AES_CTEXT1_OFFSET 0x24U
#define AES_CTEXT2_OFFSET 0x28U
#define AES_CTEXT3_OFFSET 0x2CU

#define AES_CONTROL_OFFSET 0x30U
#define AES_STATUS_OFFSET  0x34U

int main(void)
{
    unsigned int c0;
    unsigned int c1;
    unsigned int c2;
    unsigned int c3;
    unsigned int status;

    xil_printf("\r\nAES-128 hardware test started\r\n");

    /* Plaintext:
       00112233445566778899AABBCCDDEEFF */
    Xil_Out32(AES_BASEADDR + AES_PTEXT0_OFFSET, 0x00112233U);
    Xil_Out32(AES_BASEADDR + AES_PTEXT1_OFFSET, 0x44556677U);
    Xil_Out32(AES_BASEADDR + AES_PTEXT2_OFFSET, 0x8899AABBU);
    Xil_Out32(AES_BASEADDR + AES_PTEXT3_OFFSET, 0xCCDDEEFFU);

    /* Key:
       000102030405060708090A0B0C0D0E0F */
    Xil_Out32(AES_BASEADDR + AES_KEY0_OFFSET, 0x00010203U);
    Xil_Out32(AES_BASEADDR + AES_KEY1_OFFSET, 0x04050607U);
    Xil_Out32(AES_BASEADDR + AES_KEY2_OFFSET, 0x08090A0BU);
    Xil_Out32(AES_BASEADDR + AES_KEY3_OFFSET, 0x0C0D0E0FU);

    /* Start encryption and capture ciphertext */
    Xil_Out32(AES_BASEADDR + AES_CONTROL_OFFSET, 0x00000001U);

    do {
        status = Xil_In32(AES_BASEADDR + AES_STATUS_OFFSET);
    } while ((status & 0x1U) == 0U);

    c0 = Xil_In32(AES_BASEADDR + AES_CTEXT0_OFFSET);
    c1 = Xil_In32(AES_BASEADDR + AES_CTEXT1_OFFSET);
    c2 = Xil_In32(AES_BASEADDR + AES_CTEXT2_OFFSET);
    c3 = Xil_In32(AES_BASEADDR + AES_CTEXT3_OFFSET);

    xil_printf("Ciphertext = %08x%08x%08x%08x\r\n",
               c0, c1, c2, c3);

    if ((c0 == 0x69C4E0D8U) &&
        (c1 == 0x6A7B0430U) &&
        (c2 == 0xD8CDB780U) &&
        (c3 == 0x70B4C55AU)) {
        xil_printf("AES-128 HARDWARE TEST PASSED\r\n");
    } else {
        xil_printf("AES-128 HARDWARE TEST FAILED\r\n");
    }

    while (1) {
        sleep(1);
    }

    return 0;
}