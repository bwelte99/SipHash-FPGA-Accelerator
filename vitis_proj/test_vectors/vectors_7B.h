#ifndef vectors_7B
#define vectors_7B

/*
 * vectors_7B - header file w/Siphash vectors for 7-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x1E5A5376535F5D5D,
	0x38FE02111CFE53BE
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x07D74DB16C93A8A4
};

//Correct hash value:
const static uint64_t test_hash = 0x6DFA67F539301405;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif