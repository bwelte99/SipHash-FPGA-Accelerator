#ifndef vectors_15B
#define vectors_15B

/*
 * vectors_15B - header file w/Siphash vectors for 15-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x3132B8180FCF56D2,
	0x79D3800E1117BD11
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x702579BA3552B981,
	0x0FDF4A7A76E1F81A
};

//Correct hash value:
const static uint64_t test_hash = 0x71C9ABD10FDDF65C;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif