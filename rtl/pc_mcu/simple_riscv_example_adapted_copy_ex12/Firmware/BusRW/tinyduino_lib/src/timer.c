#include "timer.h"
#include "prescaler.h"
#include "init.h"
#include "io.h"

void init_timer(Timer_Reg *reg) {
  reg->CLEARS_TICKS = 0;
	reg->VALUE = 0;
}

void init_interruptCtrl(void) {
  TIMER_INTERRUPT->MASKS = 0;
  TIMER_INTERRUPT->PENDINGS = 0xF;
}

void init_all_timers(void) {
  init_interruptCtrl();
  init_prescaler(MS);
  init_timer(TIMER_A_BASE);
  init_timer(TIMER_B_BASE);
  init_timer(TIMER_C_BASE);
  init_timer(TIMER_D_BASE);
}

uint32_t status_timer(tinyduino_timers timer) {
  switch(timer) {
    case TIMER_A:
      return TIMER_A_BASE->VALUE;
    case TIMER_B:
      return TIMER_B_BASE->VALUE;
    case TIMER_C:
      return TIMER_C_BASE->VALUE;
    case TIMER_D:
      return TIMER_D_BASE->VALUE;
    default:
      return 0;
  }
}

void start_timer(tinyduino_timers timer, uint32_t limit, void (*callback)) {
  switch(timer) {
    case TIMER_A:
      TIMER_A_BASE->LIMIT = limit;
      TIMER_A_BASE->CLEARS_TICKS = 0x00010002;
      break;
    case TIMER_B:
      TIMER_B_BASE->LIMIT = limit;
      TIMER_B_BASE->CLEARS_TICKS = 0x00010002;
      break;
    case TIMER_C:
      TIMER_C_BASE->LIMIT = limit;
      TIMER_C_BASE->CLEARS_TICKS = 0x00010002;
      break;
    case TIMER_D:
      TIMER_D_BASE->LIMIT = limit;
      TIMER_D_BASE->CLEARS_TICKS = 0x00010002;
      break;
    default:
      return;
  }
  setCallbackForTimer(timer, callback);
  TIMER_INTERRUPT->PENDINGS = TIMER_INTERRUPT->PENDINGS | (0x1 << timer);
	TIMER_INTERRUPT->MASKS = TIMER_INTERRUPT->MASKS | (0x1 << timer);
}

void clear_timer(tinyduino_timers timer) {
  switch(timer) {
    case TIMER_A:
      TIMER_A_BASE->CLEARS_TICKS = 0x00010000;
      break;
    case TIMER_B:
      TIMER_B_BASE->CLEARS_TICKS = 0x00010000;
      break;
    case TIMER_C:
      TIMER_C_BASE->CLEARS_TICKS = 0x00010000;
      break;
    case TIMER_D:
      TIMER_D_BASE->CLEARS_TICKS = 0x00010000;
      break;
    default:
      return;
  }

	TIMER_INTERRUPT->PENDINGS = TIMER_INTERRUPT->PENDINGS | (0x1 << timer);
  TIMER_INTERRUPT->MASKS = TIMER_INTERRUPT->MASKS & ~(0x1 << timer);
}

tinyduino_timers timer_interrupt_cause(void) {
  int pendings = TIMER_INTERRUPT->PENDINGS;
  for (int i = 0; i < 4; i++) {
    if ((pendings >> i | 0x1) == 1)
      return i;
  }
  return -1;
}
