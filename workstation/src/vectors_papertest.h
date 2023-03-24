#ifndef vectors_papertest
#define vectors_papertest

const static uint64_t keys[] = {
		0x0706050403020100,
		0x0f0e0d0c0b0a0908
};

const static uint64_t test_vectors[] = {
		0x0706050403020100,
		0x0f0e0d0c0b0a0908
};

/*
const static uint8_t sw_test_vectors[] = {
		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
		0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E
};
*/

const static uint64_t test_hash = 0xA129CA6149BE45E5;

//size of input in bytes
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif
