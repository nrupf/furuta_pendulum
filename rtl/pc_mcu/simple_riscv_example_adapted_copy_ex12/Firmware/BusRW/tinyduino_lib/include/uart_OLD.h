#ifndef UART_H_
#define UART_H_

#include <stdint.h>

#define BAUD_RATE 115200

typedef struct
{
  volatile uint32_t DATA;
  volatile uint32_t STATUS;
  volatile uint32_t CLOCK_DIVIDER;
  volatile uint32_t FRAME_CONFIG;
} Uart_Reg;

extern void uart_send(uint32_t);
extern int uart_available(void);
extern uint32_t uart_recv(void);
extern void uart_init(void);
extern int uart_interrupt(void);
extern void enable_uart_interrupt(void (*callback));
extern void disable_uart_interrupt(void);
extern char read_char(void);
extern char* read_line(uint16_t maximum);

#endif /* UART_H_ */
