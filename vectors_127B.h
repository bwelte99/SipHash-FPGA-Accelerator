#ifndef vectors_127B
#define vectors_127B

/*
 * vectors_127B - header file w/Siphash vectors for 127-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x784813377333AE56,
	0x386656554C45800A
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x4471CF4B26E0BFDE,
	0x2485901908B5730A,
	0x75B1C8391423A3DA,
	0x1881318F2C1409BA,
	0x4F7654F2049B779E,
	0x1F19A78931368E83,
	0x789D6CA650C989BB,
	0x2C1DFFAB2DAEC948,
	0x16ABB4DD4D50F685,
	0x5B7BC5D66A6656AA,
	0x6D96A3A8091504CF,
	0x77D48B486F371B4B,
	0x562DEFE83581B116,
	0x28B55F6C576EA1F5,
	0x23B421FF4E76031F,
	0x7F56C2FE611BB5C1
};

//Correct hash value:
const static uint64_t test_hash = 0xF41F5C7F9FBFDE65;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif