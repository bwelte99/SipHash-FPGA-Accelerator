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
//#include "vectors_papertest.h"
//#include "vectors_7B.h"
//#include "vectors_15B.h"
//#include "vectors_31B.h"
//#include "vectors_63B.h"
//#include "vectors_127B.h"
//#include "vectors_255B.h"
//#include "vectors_511B.h"
//#include "vectors_1023B.h"
#include "vectors_2047B.h"
//#include "vectors_4095B.h"
//#include "vectors_8191B.h"
//#include "vectors_16383B.h"
//#include "vectors_32767B.h"
//#include "vectors_65535B.h"
//#include "vectors_1048575B.h"

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
#define DMA_ADDR (uint32_t*) 0x40400000

/*
 * Timer Register Map:
 * Base addr: 	Timer 0 Control/Status
 * Base + 1:	Timer 0 Load Reg
 * Base + 2:	Timer 0 Count Reg
 */
#define TIMER_ADDR (uint32_t*) 0x42800000

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
#define SIPHASH_ADDR (uint32_t*) 0x43C00000

int main()
{
    init_platform();

    xil_printf("\n\n\r*******************************\n\r");
    xil_printf("Starting %d-byte test ...\n\r", test_vector_size_bytes);

    uint32_t hw_start_time, hw_end_time, hw_hash_time = 0;

    uint32_t sw_start_time, sw_end_time, sw_hash_time;

    uint32_t volatile hw_count = 0;

    //strings to store hash values for strcmp
    char hw_hash_string[20];
    char sw_hash_string[20];

    uint8_t* sw_hash_ptr = malloc(sizeof(uint64_t));

    //Get vectors' address in DRAM
    const uint64_t* test_vectors_addr = test_vectors;

    xil_printf("Test vectors are stored at 0x%08x\n\r", test_vectors_addr);

    //*******************
    //Program SipHash
    //*******************
    //Reset SipHash core
    *(SIPHASH_ADDR + 4) = 1;
    *(SIPHASH_ADDR + 4) = 0;

    //Write k0 to registers 0 and 1
    *(SIPHASH_ADDR) = keys[0] & 0xFFFFFFFF;
    *(SIPHASH_ADDR + 1) = (keys[0] & 0xFFFFFFFF00000000) >> 32;

    //Write k1 to registers 2 and 3
    *(SIPHASH_ADDR + 2) = keys[1] & 0xFFFFFFFF;
    *(SIPHASH_ADDR + 3) = (keys[1] & 0xFFFFFFFF00000000) >> 32;

    //Read keys back and print them to Putty

    uint32_t k0_read_low = *(SIPHASH_ADDR);
    uint32_t k0_read_high = *(SIPHASH_ADDR + 1);

    uint32_t k1_read_low = *(SIPHASH_ADDR + 2);
    uint32_t k1_read_high = *(SIPHASH_ADDR + 3);

    xil_printf("Keys: \t%08X%08X\n\r", k0_read_high, k0_read_low);
    xil_printf("\t%08X%08X\n\r", k1_read_high, k1_read_low);


    //******************
    //Program the DMA
    //******************
    //Reset the DMA
    *(DMA_ADDR) |= 0x4;
    usleep(1000);

    //Set Run = 1 in control reg
    *(DMA_ADDR) |= 0x1;

    //set src_addr = test_vectors_addr
    *(DMA_ADDR + 6) = (uint32_t)test_vectors_addr;

    //*******************
    //Configure the Timer
    //*******************
    //Initialize the Load Reg as 0x0000_0000
    *(TIMER_ADDR + 1) = 0xFFFFFFFF;

    //Configure the timer in cyclic, generate, count-up mode
    *(TIMER_ADDR) = 0x00000011;


    //Sleep for 10 seconds so the ILA can be armed before the DMA runs
    xil_printf("\nSleeping for 10 s (arm the ILA now!)\n\r");
    sleep(10);


    //Start the timer
    xil_printf("\nStarting Timer & DMA transaction...\n\r");
    hw_start_time = *(TIMER_ADDR + 2);
    *(TIMER_ADDR) |= 0x00000080;

    //Write message length to DMA (should start the transaction)
    //Note: this is one less than the exact size, but it will still
    //		work bc the SipHash core ignores tkeep
    *(DMA_ADDR + 10) = test_vector_size_bytes;

    //Poll SipHash count reg & stop timer when count = 1
    do {
    	hw_count = *(SIPHASH_ADDR + 5);
    }
    while(hw_count == 0);

    //Record timer value after hashing is done
    hw_end_time = *(TIMER_ADDR + 2);

    xil_printf("Exiting polling loop ...\n\r");

    //Check the hash and make sure it's valid
    uint32_t hash_lower = *(SIPHASH_ADDR + 6);
    uint32_t hash_upper = *(SIPHASH_ADDR + 7);

    //Run software version of SipHash and store timer values before and after completion
    sw_start_time = *(TIMER_ADDR + 2);
    siphash(test_vectors, test_vector_size_bytes, keys, sw_hash_ptr, 8);
    sw_end_time = *(TIMER_ADDR + 2);

    //Print results to Putty
    xil_printf("\n\r*******************************\n\r");
    xil_printf("Results:\n\r");
    xil_printf("*******************************\n\r");

    xil_printf("Hardware Hash: %08X%08X\n\r", hash_upper, hash_lower);
    sprintf(hw_hash_string, "%08lX%08lX", hash_upper, hash_lower);

    xil_printf("Software Hash: ");

    for (int i = 7; i >= 0; i--){
    	xil_printf("%02X", *(sw_hash_ptr + i));
    }
    xil_printf("\n\r");

    sprintf(sw_hash_string, "%02X%02X%02X%02X%02X%02X%02X%02X", *(sw_hash_ptr + 7), *(sw_hash_ptr + 6), *(sw_hash_ptr + 5), *(sw_hash_ptr + 4), *(sw_hash_ptr + 3), *(sw_hash_ptr + 2), *(sw_hash_ptr + 1), *(sw_hash_ptr));

    //int ok = ((sw_hash_lower == hw_hash_lower) && (sw_hash_upper == hw_hash_upper));
    int ok = !strcmp(sw_hash_string, hw_hash_string);

    if(ok){
    	xil_printf("\n\rThe hash matches :)\n\r");
    }
    else{
    	xil_printf("The hash does not match :(\n\r");
    }

    //calculate hash times (accounting for overflow)
    hw_hash_time = hw_end_time - hw_start_time;
    if(hw_hash_time < 0){
    	hw_hash_time += 0xFFFFFFFF;
    }

    sw_hash_time = sw_end_time - sw_start_time;
    if(sw_hash_time < 0){
    	sw_hash_time += 0xFFFFFFFF;
    }

    xil_printf("Hardware Hashing Time: %d clock cycles\n\r", hw_hash_time);

    xil_printf("Software hashing time: %d cycles", sw_hash_time);

    free(sw_hash_ptr);

    cleanup_platform();
    return 0;
}
