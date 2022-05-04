#ifndef vectors_63B
#define vectors_63B

/*
 * vectors_63B - header file w/Siphash vectors for 63-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x5EB833B64B072155,
	0x5F31C6506FD5D011
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x0C4DC80137A7A66B,
	0x0A174F881D835D1E,
	0x49C3C6DC6F58A342,
	0x7D4CF2CD3B645809,
	0x691F9D60175B6E87,
	0x2435401F47A59827,
	0x6DBE10E93F2653F5,
	0x3FA1147E73FB9822
};

//Correct hash value:
const static uint64_t test_hash = 0x3A8029C75A374E87;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif