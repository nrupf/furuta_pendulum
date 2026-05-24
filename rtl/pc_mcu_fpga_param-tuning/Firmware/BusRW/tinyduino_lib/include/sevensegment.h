#ifndef _SEVENSEGMENT_H_
#define _SEVENSEGMENT_H_

#include <stdint.h>

typedef enum {SEGMENT_0, SEGMENT_1, SEGMENT_2, SEGMENT_3, SEGMENT_4, SEGMENT_5} s_segment_t;

extern void s_segment_set_char(s_segment_t segment, char c);
extern char s_segment_get_char(s_segment_t segment);
extern void s_segment_set_value(s_segment_t segment, uint8_t value);
extern uint8_t s_segment_get_value(s_segment_t segment);
extern uint32_t s_segment_low_value(void);
extern uint32_t s_segment_high_value(void);

#endif
