/*
 * main.c: simple test application for SipHash reading from DRAM
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "platform.h"
#include "xil_printf.h"
#include "siphash.h"
#include "vectors.h"
#include "zedboard_addresses.h"
//#include "zcu106_addresses.h"

//Number of SipHash in this test
#define NUM_TEST_CORES 8

//Choose between hardware/software version of SipHash to test
//	NOTE: compile w/-O0 for Hardware, -O3 for Software
static enum modes {
	HARDWARE, SOFTWARE
};

#define TIMING_MODE SOFTWARE

/*
 * Helper function to update the size of the test vectors for the next test case
 * Test vector sizes are from vectors_full.h
 */
int update_test_vec_size(int old_size);

int main() {
	init_platform();

	//***********************
	//Configure the Timer
	//***********************
	//Initialize the Load Reg as 0x0000_0000
	*(TIMER_ADDR + 1) = 0xFFFFFFFF;

	//Configure the timer in cyclic, generate, count-up mode
	*(TIMER_ADDR) = 0x00000011;

	//TIMING_MODE = 1: test SipHash hardware
	if (TIMING_MODE == HARDWARE) {

		xil_printf("\n\n\r*******************************\n\r");
		xil_printf("STARTING SIPHASH HARDWARE TEST :]\n\r");
		xil_printf("%d SipHash cores\n\r", NUM_TEST_CORES);

		uint32_t hw_start_time, hw_end_time, hw_hash_time = 0;

		//Get vectors' address in DRAM
		const uint64_t* test_vectors_addr = test_vectors;

		xil_printf("Test vectors are stored at 0x%08x\n\r", test_vectors_addr);

		//***********************
		//Program SipHash core(s)
		//***********************
		for (int i = 0; i < NUM_TEST_CORES; i++) {
			//Reset SipHash core
			*(SIPHASH_ADDR[i] + 4) = 1;
			*(SIPHASH_ADDR[i] + 4) = 0;

			//Write k0 to registers 0 and 1
			*(SIPHASH_ADDR[i]) = keys[0] & 0xFFFFFFFF;
			*(SIPHASH_ADDR[i] + 1) = (keys[0] & 0xFFFFFFFF00000000) >> 32;

			//Write k1 to registers 2 and 3
			*(SIPHASH_ADDR[i] + 2) = keys[1] & 0xFFFFFFFF;
			*(SIPHASH_ADDR[i] + 3) = (keys[1] & 0xFFFFFFFF00000000) >> 32;

			//Read keys back and print them to Putty
			uint32_t k0_read_low = *(SIPHASH_ADDR[i]);
			uint32_t k0_read_high = *(SIPHASH_ADDR[i] + 1);

			uint32_t k1_read_low = *(SIPHASH_ADDR[i] + 2);
			uint32_t k1_read_high = *(SIPHASH_ADDR[i] + 3);

			if (i == 0) {
				xil_printf("SipHash Keys %d: \t%08X%08X\n\r", i, k0_read_high,
						k0_read_low);
				xil_printf("\t\t\t%08X%08X\n\r", k1_read_high, k1_read_low);
			}
		}

		//**********************
		//Program the DMA(s)
		//**********************
		for (int i = 0; i < NUM_TEST_CORES; i++) {

			//Reset the DMA
			*(DMA_ADDR[i]) |= 0x4;
			usleep(1000);

			//Set Run = 1 in control reg
			*(DMA_ADDR[i]) |= 0x1;

			//set src_addr = test_vectors_addr
			*(DMA_ADDR[i] + 6) = (uint32_t) test_vectors_addr;

		}

		//arm the ILA if needed:
		/*
		 xil_printf("\nSleeping for 10 s (arm the ILA now!)\n\r");
		 sleep(10);
		 */

		//*************************************************************
		//run 15 times, collecting data for different vector lengths
		//*************************************************************

		int test_vector_size_bytes = 7;
		int hash_index = 0;
		volatile uint32_t temp_hash;
		uint32_t hash_check;

		while (test_vector_size_bytes <= 1048575) {

			xil_printf("\n\r\t------\n\r");
			xil_printf("\t%d-byte test\n\r", test_vector_size_bytes);

			hash_check = (0xFFFFFFFF & hashes[hash_index]);

			/*
			xil_printf("\n\rSleeping for 10 s (ARM THE ILA NOW!)");
			sleep(10);
			*/

			//Start the timer
			hw_start_time = *(TIMER_ADDR + 2);
			*(TIMER_ADDR) |= 0x00000080;

			//Write message length to DMAs (should start transactions)
			//Note: the lengths returned by update_test_vec_size() are one less than the
			//		actual transaction lengths, but the core will still receive the correct
			//		input bc the DMA will stream the full 64-bit memory value and the
			//		SipHash core ignores tkeep
			for (int i = 0; i < NUM_TEST_CORES; i++) {
				*(DMA_ADDR[i] + 10) = test_vector_size_bytes;
			}

			//poll hashes to know when to stop the timer
			for (int i = 0; i < NUM_TEST_CORES; i++) {
				do {
					temp_hash = *(SIPHASH_ADDR[i] + 6);
				} while (hash_check != temp_hash);
			}

			//Record timer value after hashing is done
			hw_end_time = *(TIMER_ADDR + 2);

			//Check the hash and make sure it's valid
			int flag = 0;

			//check the 0th hash
			uint32_t hash_lower = *(SIPHASH_ADDR[0] + 6);
			uint32_t hash_upper = *(SIPHASH_ADDR[0] + 7);

			//check that ith hash match the 0th
			for (int i = 1; i < NUM_TEST_CORES; i++) {
				if (hash_lower != *(SIPHASH_ADDR[i] + 6)) {
					flag = i;
				} else if (hash_upper != *(SIPHASH_ADDR[i] + 7)) {
					flag = i;
				}
			}

			//Print results to Putty
			xil_printf("\tHardware Hash: %08X%08X\n\r", hash_upper, hash_lower);
			if (flag) {
				xil_printf("\tWARNING: hash 0 and hash %d don't match!\n\r",
						flag);
				xil_printf("\tHash %d is %08lX%08lX\n\r", flag,
						*(SIPHASH_ADDR[flag] + 7), *(SIPHASH_ADDR[flag] + 6));
			}

			int ok = (hash_lower == (hashes[hash_index] & 0xFFFFFFFF))
					& (hash_upper == ((hashes[hash_index] & 0xFFFFFFFF00000000) >> 32));

			if (ok) {
				xil_printf("\n\r\tThe hash is good :)\n\r");
			} else {
				xil_printf("\tThe hash is bad :(\n\r");
			}

			//calculate hash times (accounting for overflow)
			hw_hash_time = hw_end_time - hw_start_time;
			if (hw_hash_time < 0) {
				hw_hash_time += 0xFFFFFFFF;
			}

			xil_printf("\tHardware Hashing Time: %d clock cycles\n\r",
					hw_hash_time);

			test_vector_size_bytes = update_test_vec_size(
					test_vector_size_bytes);

			//increment hash index to check the next hash
			hash_index++;

		}

	}

	else if (TIMING_MODE == SOFTWARE){

		uint32_t sw_start_time, sw_end_time, sw_hash_time;
		uint8_t* sw_hash_ptr = malloc(sizeof(uint64_t));
		char sw_hash_string[20], expected_hash_string[20];

		int hash_index = 0;
		int test_vector_size_bytes = 7;

		//Time SipHash for each input vector size in vectors_full.h
		while (test_vector_size_bytes <= 1048575) {

			//Run software version of SipHash and store timer values before and after completion
			sw_start_time = *(TIMER_ADDR + 2);
			*(TIMER_ADDR) |= 0x00000080;

			for (int i = 0; i < NUM_TEST_CORES; i++) {
				siphash(test_vectors, test_vector_size_bytes, keys, sw_hash_ptr,
						8);
			}
			sw_end_time = *(TIMER_ADDR + 2);

			//Print the resulting software hash value
			xil_printf("\n\r\tSoftware Hash: ");
			for (int i = 7; i >= 0; i--) {
				xil_printf("%02X", *(sw_hash_ptr + i));
			}
			xil_printf("\n\r");

			//convert software hash to a string to check it's correct
			sprintf(sw_hash_string, "%02X%02X%02X%02X%02X%02X%02X%02X",
					*(sw_hash_ptr + 7), *(sw_hash_ptr + 6), *(sw_hash_ptr + 5),
					*(sw_hash_ptr + 4), *(sw_hash_ptr + 3), *(sw_hash_ptr + 2),
					*(sw_hash_ptr + 1), *(sw_hash_ptr));

			//convert correct hash to a string to check against the software hash
			sprintf(expected_hash_string, "%016llX", hashes[hash_index]);
			xil_printf("\tExpected Hash: %s\n\r", expected_hash_string);

			if (!strcmp(expected_hash_string, sw_hash_string)){
				xil_printf("\tThe hashes match! :]\n\r");
			}
			else{
				xil_printf("\tThe hashes don't match :[\n\r");
			}

			//calculate software hash time & print it
			sw_hash_time = sw_end_time - sw_start_time;
			if (sw_hash_time < 0) {
				sw_hash_time += 0xFFFFFFFF;
			}

			xil_printf("\tInput size: %d bytes\n\r", test_vector_size_bytes);
			xil_printf("\tSoftware hashing time for %d iterations of SipHash: \n\r\t\t%d cycles", NUM_TEST_CORES, sw_hash_time);
			xil_printf("\n\r");

			//move to next input vector size
			test_vector_size_bytes = update_test_vec_size(
					test_vector_size_bytes);

			//increment hash index to check the next hash
			hash_index++;

		}

		free(sw_hash_ptr);
	}

	cleanup_platform();
	return 0;
}

int update_test_vec_size(int old_size) {

	int new_size = 7;
	switch (old_size) {
	case (7):
		new_size = 15;
		break;
	case (15):
		new_size = 31;
		break;
	case (31):
		new_size = 63;
		break;
	case (63):
		new_size = 127;
		break;
	case (127):
		new_size = 255;
		break;
	case (255):
		new_size = 511;
		break;
	case (511):
		new_size = 1023;
		break;
	case (1023):
		new_size = 2047;
		break;
	case (2047):
		new_size = 4095;
		break;
	case (4095):
		new_size = 8191;
		break;
	case (8191):
		new_size = 16383;
		break;
	case (16383):
		new_size = 32767;
		break;
	case (32767):
		new_size = 65535;
		break;
	case (65535):
		new_size = 1048575;
		break;
	case (1048575):
		new_size = 1048576;
		break;
	}
	return new_size;
}
