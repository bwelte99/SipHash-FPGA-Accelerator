/*
 * server.c: simple application to test SipHash's throughput on a given CPU
 *
 */

#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "siphash.h"
#include "vectors.h"

//Number of SipHash iterations in this test (the FPGA design supports 1 <= N <= 16)
#define NUM_TEST_CORES 16

//declare loop variable here to make the compiler happy
int i;

/*
 * Helper function to update the size of the test vectors for the next test case
 * Test vector sizes are from vectors_full.h
 */
int update_test_vec_size(int old_size);

int main() {

	uint32_t sw_start_time, sw_end_time, sw_hash_time;
	double sw_throughput;
	uint8_t* sw_hash_ptr = malloc(sizeof(uint64_t));
	char sw_hash_string[20], expected_hash_string[20];

	int hash_index = 0;
	int test_vector_size_bytes = 7;

	struct timeval current_time;

	//Time SipHash for each input vector size in vectors_full.h
	while (test_vector_size_bytes <= 1048575) {

		//Run software version of SipHash and store timer values before and after completion
		gettimeofday(&current_time, NULL);
		sw_start_time = current_time.tv_usec;		

		for (i = 0; i < NUM_TEST_CORES; i++) {
			siphash(test_vectors, test_vector_size_bytes, keys, sw_hash_ptr,
					8);
		}
		gettimeofday(&current_time, NULL);
		sw_end_time = current_time.tv_usec;

		//calculate hash time in us and throughput in Gbps
		sw_hash_time = sw_end_time - sw_start_time;

		//calculate throughput ((num_bits / ns) / 1000000000)
		sw_throughput = (NUM_TEST_CORES*8*(double)test_vector_size_bytes) / ((double)sw_hash_time * 1000);


		//Print the resulting software hash value
		printf("\n\r\tSoftware Hash: ");
		for (i = 7; i >= 0; i--) {
			printf("%02X", *(sw_hash_ptr + i));
		}
		printf("\n\r");

		//convert software hash to a string to check it's correct
		sprintf(sw_hash_string, "%02X%02X%02X%02X%02X%02X%02X%02X",
				*(sw_hash_ptr + 7), *(sw_hash_ptr + 6), *(sw_hash_ptr + 5),
				*(sw_hash_ptr + 4), *(sw_hash_ptr + 3), *(sw_hash_ptr + 2),
				*(sw_hash_ptr + 1), *(sw_hash_ptr));

		//convert correct hash to a string to check against the software hash
		sprintf(expected_hash_string, "%016llX", hashes[hash_index]);
		printf("\tExpected Hash: %s\n\r", expected_hash_string);

		if (!strcmp(expected_hash_string, sw_hash_string)){
			printf("\tThe hashes match! :]\n\r");
		}
		else{
			printf("\tThe hashes don't match :[\n\r");
		}

		printf("\tInput size: %d bytes\n\r", test_vector_size_bytes);
		printf("\tSoftware latency & throughput for %d iterations of SipHash: \n\r\t\t%d us \n\r\t\t%.2lf Gbps", NUM_TEST_CORES, sw_hash_time, sw_throughput);
		printf("\n\r");

		//move to next input vector size
		test_vector_size_bytes = update_test_vec_size(
		test_vector_size_bytes);

		//increment hash index to check the next hash
		hash_index++;

	}

	free(sw_hash_ptr);

	return 0;
}

//helper function
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
