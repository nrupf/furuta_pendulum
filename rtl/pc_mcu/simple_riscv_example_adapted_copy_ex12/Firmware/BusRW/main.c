/*
 * Simple program to parse the input from the UART and read / write from/to
 * addresses. 
 * 
 * Protocol:
 * to read:
 *   r <address>\n
 *   returns: "OK OK, addr: <hex> data: <hex> \n"
 * to write:
 *   w <address> <data>\n
 *   returns: "OK OK, addr: <hex> data: <hex> \n"
 */

#include "tinyDuino.h"
#include <stdlib.h>
#include <string.h>


void uart_callback() {
    while(uart_available()) {
        char str[255];
        read_line(str, 100);
        printf("%s", str);
        // parse the code using the tokenizer:
        char* cmdChr = strtok(str, " ");
        if (cmdChr == NULL){
            //free(str);
            return;
        }
        char* addrStr = strtok(NULL, " ");
        uint32_t addr = strtoul(addrStr, NULL, 0);
        // check if address is one of the defined ones on the bus or after then the bus adress space to prevent locked system:
        if(addr == 0xf0000004||addr == 0xf0000008||addr == 0xf000000C || ((addr >= 0xf0000400) && (addr < 0xf0000800))){

            // if write operation:
            if (cmdChr[0] == 'w' ){
                
                if (addrStr == NULL){
                    //free(str);
                    printf("E\n");
                    return;
                }
                char* valueStr = strtok(NULL, " ");
                if (valueStr == NULL){
                    //free(str);
                    printf("E\n");
                    return;
                }
                uint32_t value = strtoul(valueStr, NULL, 0);
                // here set the value of the register:
                (* (volatile uint32_t *) addr) = value;
                printf("OK, addr: 0x%08x data: 0x%08x \n", addr, value);
            }

            // if read operation:
            if (cmdChr[0] == 'r' ){
                if (addrStr == NULL){
                    //free(str);
                    printf("E\n");
                    return;
                }
                
                // here read the value of the register:
                uint32_t value = (* (volatile uint32_t *) addr);
                printf("OK, addr: 0x%08x data: 0x%08x \n", addr, value);
            }
        }
        else{
            printf("Address 0x%08x does not exist. \n",addr);
        }
        //free(str);
    }
}


int main(void) {
    init_tiny();
    enable_uart_interrupt(uart_callback);
    printf("BusRW\n");
    /*while(1){
        for (int i = 0; i < 1000000; i++);
        (* (volatile uint32_t *) 0xf0000004) = 0xff;
        for (int i = 0; i < 1000000; i++);
        (* (volatile uint32_t *) 0xf0000004) = 0;
    }*/
}
