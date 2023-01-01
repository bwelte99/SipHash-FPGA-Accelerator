#ifndef addresses
#define addresses

/*
 * header file defining addresses for devices in block diagram
 */

/*
 * DMA Register Map:
 * 	Base addr:	MM2S Control Reg
 * 	Base + 1:	MM2S Status Reg
 * 	...
 * 	Base + 6:	source addr[31:0]
 * 	Base + 7:	source addr[63:32]
 * 	...
 * 	base + 10: MM2S Transfer Length (bytes)
 */
uint32_t* const DMA_ADDR[] = {
		(uint32_t*) 0xA0100000, //0
		(uint32_t*) 0xA01A0000, //4
		(uint32_t*) 0xA01E0000, //8
		(uint32_t*) 0xA0140000, //12

		(uint32_t*) 0xA0110000, //1
		(uint32_t*) 0xA01B0000, //5
		(uint32_t*) 0xA01F0000, //9
		(uint32_t*) 0xA0150000, //13

		(uint32_t*) 0xA0180000, //2
		(uint32_t*) 0xA01C0000, //6
		(uint32_t*) 0xA0120000, //10
		(uint32_t*) 0xA0160000, //14

		(uint32_t*) 0xA0190000, //3
		(uint32_t*) 0xA01D0000, //7
		(uint32_t*) 0xA0130000, //11
		(uint32_t*) 0xA0170000 //15

};

/*
 * Timer Register Map:
 * Base addr: 	Timer 0 Control/Status
 * Base + 1:	Timer 0 Load Reg
 * Base + 2:	Timer 0 Count Reg
 */
uint32_t* const TIMER_ADDR = (uint32_t*) 0xA0200000;

/*
 * SipHash Register Map:
 * 	Base addr: 	k0[31:0]
 * 	Base + 1:	k0[63:32]
 * 	Base + 2:	k1[31:0]
 * 	Base + 3:	k1[63:32]
 * 	Base + 4:	Soft Reset (active high, only 0th bit)
 * 	Base + 5:	Hash count
 * 	Base + 6:	Hash value [31:0]
 * 	Base + 7:	Hash value [63:32]
 */
uint32_t* const SIPHASH_ADDR[] = {
		(uint32_t*) 0xA0000000, //0
		(uint32_t*) 0xA00A0000, //4
		(uint32_t*) 0xA00E0000, //8
		(uint32_t*) 0xA0040000, //12

		(uint32_t*) 0xA0010000, //1
		(uint32_t*) 0xA00B0000, //5
		(uint32_t*) 0xA00F0000, //9
		(uint32_t*) 0xA0050000, //13

		(uint32_t*) 0xA0080000, //2
		(uint32_t*) 0xA00C0000, //6
		(uint32_t*) 0xA0020000, //10
		(uint32_t*) 0xA0060000, //14

		(uint32_t*) 0xA0090000, //3
		(uint32_t*) 0xA00D0000, //7
		(uint32_t*) 0xA0030000, //11
		(uint32_t*) 0xA0070000 //15
};

#endif
