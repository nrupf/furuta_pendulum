#ifndef INIT_H_
#define INIT_H_

#include "timer.h"

#define CAUSE_MACHINE_TIMER 7
#define CAUSE_MACHINE_EXTERNAL 11

void init_tiny();
void setCallbackForTimer(tinyduino_timers timer, void (*callback));
void setCallbackForUART(void (*callback));
void setCallbackForExternal(void (*callback));
void timerInterrupt();
void externalInterrupt();
void crash();

#endif
