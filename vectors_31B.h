#ifndef vectors_31B
#define vectors_31B

/*
 * vectors_31B - header file w/Siphash vectors for 31-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x0AE1BED4383653DF,
	0x5351367A6DD2C78E
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x289FBB7464B0D1B0,
	0x7C7A2F55626EFEFD,
	0x3FF854FD01F3BC68,
	0x1F0C77096B635C3A
};

//Correct hash value:
const static uint64_t test_hash = 0xE652CD2E8F5F8034;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif