#include "prescaler.h"
#include "io.h"

extern void init_prescaler(prescaler_time_scale time_scale){
  TIMER_PRESCALER->LIMIT = time_scale;
}
