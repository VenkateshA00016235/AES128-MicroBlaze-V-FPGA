#include <stdio.h>
#include "xil_printf.h"
#include <stdint.h>

#define AES_BLOCK_SIZE 16
#define AES_KEY_SIZE 16
#define AES_ROUNDS 10

//S-box table for aes from the aes standard document
static const uint8_t sbox[256] = {
	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16

};

//these values willl be used for key expansion, these also from aes standard document

static const uint8_t rcon[11] = {
	0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
} ;

// this function does subbytes step
// this replaces every byte in the state with sbox value

void sub_bytes(uint8_t *state)

{
	int i;
	for(i = 0; i < 16; i++)
	{
		state[i] = sbox[state[i]];
	}
}

// this function does shiftrows step
// state is treated like a 4x4 grid, column by column
// row 0 - no shift, row 1 - shift left by 1, row 2 - shift left by 2, row 3 - shift left by 3

void shift_rows(uint8_t *state)
{
	uint8_t temp;
	
	// row 1, shift left by 1
	
	temp = state[1];
	state[1] = state[5];
	state[5] = state[9];
	state[9] = state[13];
	state[13] = temp;
	
	// row 2, shift left by 2
	
	temp = state[2];
	state[2] = state[10];
	state[10] = temp;
	temp = state[6];
	state[6] = state[14];
	state[14] = temp;

	//row 3, shift left by 3 (same as shift right by 1)
	temp = state[15];
	state[15] = state[11];
	state[11] = state[7];
	state[7] = state[3];
	state[3] = temp;
}

// galois field multiplication, writing this for mixcolumns
uint8_t gmul(uint8_t a, uint8_t b)
{
    uint8_t p = 0;
    uint8_t i;
    for(i = 0; i < 8; i++)
    {
        if(b & 1)
            p ^= a;

        uint8_t hi_bit_set = a & 0x80;
        a <<= 1;
        if(hi_bit_set)
            a ^= 0x1b; // this is the aes irreducible polynomial
		b >>= 1;
    }
    return p;
}

// this function does mixcolumns step
// it mixes the 4 bytes in each column using matrix multiplication
void mix_columns(uint8_t *state)
{
    uint8_t temp[4];
    int col;

    for(col = 0; col < 4; col++)
	{
        temp[0] = state[col*4+0];
        temp[1] = state[col*4+1];
        temp[2] = state[col*4+2];
        temp[3] = state[col*4+3];

        state[col*4+0] = (uint8_t)(gmul(temp[0],2) ^ gmul(temp[1],3) ^ temp[2] ^ temp[3]);
        state[col*4+1] = (uint8_t)(temp[0] ^ gmul(temp[1],2) ^ gmul(temp[2],3) ^ temp[3]);
        state[col*4+2] = (uint8_t)(temp[0] ^ temp[1] ^ gmul(temp[2],2) ^ gmul(temp[3],3));
        state[col*4+3] = (uint8_t)(gmul(temp[0],3) ^ temp[1] ^ temp[2] ^ gmul(temp[3],2));
    }
}

// this function does addroundkey step
// just xor the state with the round key bytes
void add_round_key(uint8_t *state, uint8_t *round_key)
{
    int i;
    for(i = 0; i < 16; i++)
    {
        state[i] = state[i] ^ round_key[i];
    }
}

// this function does key expansion
// it takes the 16 byte key and makes 11 round keys (176 bytes total)
void key_expansion(uint8_t *key, uint8_t *round_keys)
{
    int i ;
    uint8_t temp[4];
    uint8_t k;

    // first round key is just the original key
    for(i = 0; i < 16; i++)
    {
        round_keys[i] = key[i];
    }

	// bytes_generated keeps track of how many bytes we made so far
    int bytes_generated = 16;
    int rcon_index = 1;

    while(bytes_generated < 176)
    {
        // take the last 4 bytes
        for(i = 0; i < 4; i++)
        {
			temp[i] = round_keys[bytes_generated - 4 + i];
        }

        // every 16 bytes we do the key schedule core
        if(bytes_generated % 16 == 0)
        {
            // rotate left by 1
            uint8_t t = temp[0];
            temp[0] = temp[1];
            temp[1] = temp[2];
            temp[2] = temp[3];
            temp[3] = t;
			// substitute using sbox
            for(i = 0; i < 4; i++)
            {
                temp[i] = sbox[temp[i]];
            }

            // xor first byte with rcon
            temp[0] = temp[0] ^ rcon[rcon_index];
            rcon_index++;
        }
		// xor with the bytes 16 positions back
        for(i = 0; i < 4; i++)
        {
            k = round_keys[bytes_generated - 16 + i];
            round_keys[bytes_generated] = k ^ temp[i];
            bytes_generated++;
        }
    }
}

// this is the main function that does aes128 encryption
// input = 16 bytes plaintext, output = 16 bytes ciphertext, key = 16 bytes key
void aes128_encrypt(uint8_t *input, uint8_t *output, uint8_t *key)
{
    uint8_t state[16];
    uint8_t round_keys[176];
    int round;
    int i;

    // copy the input to state, it work on this
    for(i = 0; i < 16; i++)
    {
		state[i] = input[i];
    }

    // make all the round keys
    key_expansion(key, round_keys);

    // round 0 is just addroundkey
    add_round_key(state, round_keys);
// rounds 1 to 9 are normal rounds
    for(round = 1; round < 10; round++)
    {
        sub_bytes(state);
        shift_rows(state);
        mix_columns(state);
        add_round_key(state, round_keys + (round*16));
    }

    // last round (round 10) doesnt have mixcolumns
    sub_bytes(state);
    shift_rows(state);
    add_round_key(state, round_keys + (10*16));
	// copy state to the output
    for(i = 0; i < 16; i++)
    {
        output[i] = state[i];
    }
}

int main ()

{
	xil_printf("AES-128 test starting\n\r");

	// this is the  test vector from nist fips 197 document
    // plaintext, key and expected ciphertext are all given in the document
    uint8_t plaintext[16] = {
        0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff
    };

    uint8_t key[16] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
    };

	// this is what the answer should be, given in nist document
    uint8_t expected_ciphertext[16] = {
        0x69, 0xc4, 0xe0, 0xd8, 0x6a, 0x7b, 0x04, 0x30,
        0xd8, 0xcd, 0xb7, 0x80, 0x70, 0xb4, 0xc5, 0x5a
    };

    uint8_t output[16];
    int i;
    int match = 1; // assuming it matches, will check down

    aes128_encrypt(plaintext, output, key);
	xil_printf("Ciphertext generated:\n\r");
    for(i = 0; i < 16; i++)
    {
        xil_printf("%02x ", output[i]);
    }
    xil_printf("\n\r");

    //  check if output matches expected ciphertext
    for(i = 0; i < 16; i++)
    {
		if(output[i] != expected_ciphertext[i])
        {
            match = 0;
        }
    }

    if(match == 1)
    {
        xil_printf("TEST PASSED - matches nist test vector\n\r");
    }
    else
	{
        xil_printf("TEST FAILED - does not match\n\r");
    }
	
	return 0;
}