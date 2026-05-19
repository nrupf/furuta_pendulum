#include "uart.h"
#include "init.h"
#include "io.h"
#include <stdlib.h>

void uart_send(uint32_t c) {
  while (1) {
    if (((UART->STATUS >> 16) && 0xFF) != 0) {
      break;
    }
  }
  UART->DATA = c;
}

int uart_available(void) {
  return UART->STATUS >> 24;
}

uint32_t uart_recv(void) {
  while (1) {
    if (uart_available()) {
      break;
    }
  }
  return UART->DATA & 0xFF;
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

char* read_line(uint16_t maximum) {
  char* str = malloc(maximum);
  char* p = str;
  char next;
  do {
    next = read_char();
    *p++ = next;
  } while (next != 0 && next != '\n' && (p-str) < maximum);
  *p = 0;
  return str;
}
