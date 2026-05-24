#include "uart.h"
#include "init.h"
#include "io.h"
#include <stdlib.h>

void uart_send(uint32_t c) {
  volatile char dummyReg;
  while (1) {
    if (((UART->STATUS >> 16) & 0xFF) != 0) {
      break;
    }
  }
  UART->DATA = c;
}

int uart_available(void) {
  return (UART->STATUS >> 24);
}

uint32_t uart_recv(void) {
  asm volatile ("" : : : "memory");
  while (1) {
    if (uart_available() > 0) {
      break;
    }
  }
  
  uint32_t data = UART->DATA;
  return data & 0xff;
  
  
  /*
  uint32_t data;
  while(1){
      data = UART->DATA;
      if ((data >> 8) != 0)
        break;
    }
    return (data & 0xff);
    */
  
  /*  
  while (uart_available() == 0) ;
  uint32_t data = UART->DATA;
  return (data & 0xFF); */
}

void uart_init(void) {
  UART->CLOCK_DIVIDER = CORE_HZ/8/BAUD_RATE-1;
	UART->FRAME_CONFIG = ((8-1) << 0) | (0 << 8) | (1 << 16);
}

int uart_interrupt(void) {
  return UART->STATUS & (1 << 9);
}

void enable_uart_interrupt(void (*callback)) {
  setCallbackForUART(callback);
  UART->STATUS = 2;
}

void disable_uart_interrupt(void) {
  setCallbackForUART(0);
  UART->STATUS = 0;
}

char read_char(void) {
  return uart_recv();
}

void read_line(char* buffer, uint16_t maximum) {
  //char* str = malloc(maximum);
  char* p = buffer;
  char next;
  do {
    next = read_char();
    *p++ = next;
  } while (next != 0 && next != '\n' && (p-buffer) < maximum);
  *p = 0;
}
