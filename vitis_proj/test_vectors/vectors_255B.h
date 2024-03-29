#ifndef vectors_255B
#define vectors_255B

/*
 * vectors_255B - header file w/Siphash vectors for 255-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x28EAC6F021D5A4CD,
	0x52D2D68D61C3ECB0
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x3BB87E442A4D8CC9,
	0x5030D569728D4D2B,
	0x54FFD76D69655C16,
	0x6FF8A1BD400E53F8,
	0x120A84A23079BAC1,
	0x1E88DD5A38517903,
	0x78E656C75F96F6F1,
	0x437F1B7101003EA4,
	0x53F5E9E71BF4E623,
	0x689E63D7535A5137,
	0x65B4769709A83E6E,
	0x02877923333CBD9F,
	0x28BC261A0883AF16,
	0x2A5953E339727EA6,
	0x1B366B5751A6ED0A,
	0x7BF479D37D2C2A70,
	0x6FB9779C56EEE99B,
	0x405445B14C254F3C,
	0x0C33A33444B94F09,
	0x753309CA304CE76F,
	0x689E60721E3E27D7,
	0x7DD51EC813BBE725,
	0x14BC25C96184B739,
	0x7D799D5C41543A39,
	0x14AE8B7068B20FB0,
	0x725A4E1E66180133,
	0x1954BED27A630207,
	0x02E6B11D74E1C742,
	0x2E5445E84210E4EC,
	0x13B7D1F62D400500,
	0x2A6C2F71498AB13F,
	0xFF799ADB0FAC4BC9
};

//Correct hash value:
const static uint64_t test_hash = 0x652F2FCA4C9359ED;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif