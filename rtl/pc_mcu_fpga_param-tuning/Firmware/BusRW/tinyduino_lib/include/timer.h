#ifndef TIMER_H_
#define TIMER_H_

#include <stdint.h>

typedef enum {TIMER_A, TIMER_B, TIMER_C, TIMER_D} tinyduino_timers;

typedef struct
{
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

typedef struct
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} TimerInterruptCtrl_Reg;

extern void init_timer(Timer_Reg *reg);
extern void init_interruptCtrl(void);
extern void init_all_timers(void);
extern uint32_t status_timer(tinyduino_timers timer);
extern void start_timer(tinyduino_timers timer, uint32_t limit, void (*callback));
extern void clear_timer(tinyduino_timers timer);
extern tinyduino_timers timer_interrupt_cause(void);

#endif /* TIMERCTRL_H_ */
