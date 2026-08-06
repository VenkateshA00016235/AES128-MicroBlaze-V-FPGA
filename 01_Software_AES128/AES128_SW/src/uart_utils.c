#include "uart_utils.h"
#include "xil_printf.h"

static int hex_value(char c)
{
    if ((c >= '0') && (c <= '9')) {
        return c - '0';
    }

    if ((c >= 'A') && (c <= 'F')) {
        return c - 'A' + 10;
    }

    if ((c >= 'a') && (c <= 'f')) {
        return c - 'a' + 10;
    }

    return -1;
}

static void read_line(char *buffer, int max_length)
{
    int index = 0;
    char c;

    while (1) {
        c = inbyte();

        if ((c == '\r') || (c == '\n')) {
            if (index == 0) {
                continue;
            }

            buffer[index] = '\0';
            xil_printf("\r\n");
            return;
        }

        if ((c == '\b') || (c == 0x7F)) {
            if (index > 0) {
                index--;
                xil_printf("\b \b");
            }
            continue;
        }

        if (index < (max_length - 1)) {
            buffer[index++] = c;
            outbyte(c);
        }
    }
}

static int convert_hex_string(
    const char text[AES_HEX_CHARS + 1],
    uint8_t output[AES_BLOCK_SIZE]
)
{
    int i;

    for (i = 0; i < AES_BLOCK_SIZE; i++) {
        int high = hex_value(text[i * 2]);
        int low  = hex_value(text[(i * 2) + 1]);

        if ((high < 0) || (low < 0)) {
            return 0;
        }

        output[i] = (uint8_t)((high << 4) | low);
    }

    return text[AES_HEX_CHARS] == '\0';
}

void uart_read_hex_block(
    const char *prompt,
    uint8_t output[AES_BLOCK_SIZE]
)
{
    char input[AES_HEX_CHARS + 1];

    while (1) {
        xil_printf("%s", prompt);
        read_line(input, sizeof(input));

        if (convert_hex_string(input, output)) {
            return;
        }

        xil_printf(
            "Invalid input. Enter exactly 32 hexadecimal characters.\r\n"
        );
    }
}

void uart_print_block(
    const char *label,
    const uint8_t block[AES_BLOCK_SIZE]
)
{
    int i;

    xil_printf("%s", label);

    for (i = 0; i < AES_BLOCK_SIZE; i++) {
        xil_printf("%02X", block[i]);
    }

    xil_printf("\r\n");
}