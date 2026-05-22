#ifndef GPIO_H_
#define GPIO_H_

#include <stdint.h>
#include <stdbool.h>

typedef struct
{
  volatile uint32_t INPUT;
  volatile uint32_t OUTPUT;
  volatile uint32_t OUTPUT_ENABLE;
} Gpio_Reg;

extern void gpio_set_direction(Gpio_Reg *reg, uint32_t direction);
extern uint32_t gpio_read_direction(Gpio_Reg *reg);
extern void gpio_write(Gpio_Reg *reg, uint32_t value);
extern uint32_t gpio_read(Gpio_Reg *reg);
extern void gpio_write_bit(Gpio_Reg *reg, uint8_t bit, bool value);
extern bool gpio_read_bit(Gpio_Reg *reg, uint8_t bit);
extern void enable_external_interrupt(void (*callback));
extern void disable_external_interrupt(void);

#endif /* GPIO_H_ */
