#include "tinyDuino.h"
#include "init.h"

void *timerCallback[4];
void *uartCallback;
void *externalCallback;

void init_tiny() {
    uart_init();
    init_all_timers();
    uartCallback = 0;
    externalCallback = 0;
}

void interruptCallback() {
    int32_t mcause = csr_read(mcause);
    int32_t interrupt = mcause < 0;
    int32_t cause     = mcause & 0xF;
    if(interrupt){
        switch(cause){
        case CAUSE_MACHINE_TIMER: timerInterrupt(); break;
        case CAUSE_MACHINE_EXTERNAL: externalInterrupt(); break;
        default: crash(); break;
        }
    } else {
        crash();
    }
}

void setCallbackForTimer(tinyduino_timers timer, void (*callback)) {
    timerCallback[timer] = callback;
}

void setCallbackForUART(void (*callback)) {
    uartCallback = callback;
}

void setCallbackForExternal(void (*callback)) {
    externalCallback = callback;
}

void timerInterrupt() {
    tinyduino_timers interrupt_cause = timer_interrupt_cause();
    switch(interrupt_cause) {
        case TIMER_A:
        case TIMER_B:
        case TIMER_C:
        case TIMER_D:
            clear_timer(interrupt_cause);
            break;
        default:
            crash();
            return;
    }

    if (timerCallback[interrupt_cause] != 0) {
      void (*f)(void) = (void (*)(void)) timerCallback[interrupt_cause];
      f();
    } else {
        crash();
    }
}

void externalInterrupt() {
    if (uart_interrupt()) {
        if (uartCallback != 0) {
            void (*f)(void) = (void (*)(void)) uartCallback;
            f();
        }
    } else if (externalCallback != 0) {
      void (*f)(void) = (void (*)(void)) externalCallback;
      f();
    }
}

void crash() {
    while(1);
}
