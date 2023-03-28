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

#define cROUNDS 2
#define dROUNDS 4

//Number of SipHash instantiated in hardware
#define NUM_HW_CORES 8

//clock period (ns) for SipHash2-4 on the Zedboard
#define clk_per 15.33

/*
 * Helper function to update the size of the test vectors for the next test case
 * Test vector sizes are from vectors_full.h
 */
int update_test_vec_size(int old_size);

int main() {
	init_platform();

	double tput_gbps = 0.0;
	uint32_t tput_gbps_int = 0;
	uint32_t tput_gbps_rem = 0;
	uint32_t num_cores = 8;

	//***********************
	//Configure the Timer
	//***********************
	//Initialize the Load Reg as 0x0000_0000
	*(TIMER_ADDR + 1) = 0xFFFFFFFF;

	//Configure the timer in cyclic, generate, count-up mode
	*(TIMER_ADDR) = 0x00000011;

	for (num_cores = 0; num_cores < NUM_HW_CORES; num_cores++) {

		xil_printf("\n\n\r*******************************\n\r");
		xil_printf("STARTING SIPHASH%d-%d HARDWARE TEST :]\n\r", cROUNDS, dROUNDS);
		xil_printf("%d SipHash cores\n\r", (num_cores + 1));

		uint32_t hw_start_time, hw_end_time, hw_hash_time = 0;

		//Get vectors' address in DRAM
		const uint64_t* test_vectors_addr = test_vectors;

		xil_printf("Test vectors are stored at 0x%08x\n\r", test_vectors_addr);

		//***********************
		//Program SipHash core(s)
		//***********************
		for (int i = 0; i <= num_cores; i++) {
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
		}

		//**********************
		//Program the DMA(s)
		//**********************
		for (int i = 0; i <= num_cores; i++) {

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
		int test_vector_size_bytes = 1048575;
		volatile uint32_t temp_hash;
		uint32_t hash_check = (0xFFFFFFFF & hashes[14]);

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
		for (int i = 0; i <= num_cores; i++) {
			*(DMA_ADDR[i] + 10) = test_vector_size_bytes;
		}

		//poll hashes to know when to stop the timer
		for (int i = 0; i <= num_cores; i++) {
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

		//check that ith hash matches the 0th
		for (int i = 1; i <= num_cores; i++) {
			if (hash_lower != *(SIPHASH_ADDR[i] + 6)) {
				flag = i;
			} else if (hash_upper != *(SIPHASH_ADDR[i] + 7)) {
				flag = i;
			}
		}

		//Print results to Putty
		xil_printf("Hardware Hash: %08X%08X\n\r", hash_upper, hash_lower);
		if (flag) {
			xil_printf("\tWARNING: hash 0 and hash %d don't match!\n\r", flag);
			xil_printf("\tHash %d is %08lX%08lX\n\r", flag,
					*(SIPHASH_ADDR[flag] + 7), *(SIPHASH_ADDR[flag] + 6));
		}

		int ok = (hash_lower == (hashes[14] & 0xFFFFFFFF))
				& (hash_upper == ((hashes[14] & 0xFFFFFFFF00000000) >> 32));

		if (ok) {
			xil_printf("\n\rThe hash is correct :)\n\r");
		} else {
			xil_printf("\n\rThe hash is wrong :(\n\r");
		}

		//calculate hash times (accounting for overflow)
		hw_hash_time = hw_end_time - hw_start_time;
		if (hw_hash_time < 0) {
			hw_hash_time += 0xFFFFFFFF;
		}

		tput_gbps = (8 * test_vector_size_bytes * (num_cores + 1))
				/ ((double) hw_hash_time * clk_per);
		tput_gbps_int = (uint32_t) tput_gbps;
		tput_gbps_rem = (tput_gbps - tput_gbps_int) * 1000;

		xil_printf("Hardware Hashing Time: %d clock cycles\n\r",
				hw_hash_time);
		xil_printf("Hardware Throughput: %d.%3d Gbps\n", tput_gbps_int,
				tput_gbps_rem);
	}

	cleanup_platform();
	return 0;
}
