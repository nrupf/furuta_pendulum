#include "gpio.h"
#include "init.h"
#include "io.h"

void gpio_set_direction(Gpio_Reg *reg, uint32_t direction) {
  reg->OUTPUT_ENABLE = direction;
}

uint32_t gpio_read_direction(Gpio_Reg *reg) {
  return reg->OUTPUT_ENABLE;
}

void gpio_write(Gpio_Reg *reg, uint32_t value) {
  reg->OUTPUT = value;
}

uint32_t gpio_read(Gpio_Reg *reg) {
  return reg->INPUT;
}

void gpio_write_bit(Gpio_Reg *reg, uint8_t bit, bool value) {
  uint32_t val = gpio_read(reg) | ((uint32_t)value << bit);
  gpio_write(reg, val);
}

bool gpio_read_bit(Gpio_Reg *reg, uint8_t bit) {
  return (gpio_read(reg) >> bit) & 0x1;
}

void enable_external_interrupt(void (*callback)) {
  setCallbackForExternal(callback);
}

void disable_external_interrupt(void) {
  setCallbackForExternal(0);
}
