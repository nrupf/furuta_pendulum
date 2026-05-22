#ifndef PRESCALERCTRL_H_
#define PRESCALERCTRL_H_

#include <stdint.h>

typedef enum {US = 50, MS = 50000, S = 50000000} prescaler_time_scale;

typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

extern void init_prescaler(prescaler_time_scale time_scale);

#endif /* PRESCALERCTRL_H_ */
