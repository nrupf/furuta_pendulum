#include "sevensegment.h"
#include "io.h"
#include "gpio.h"

char segment_values[6] = {[0 ... 5 ] = 0xFF};

const unsigned char segmentMap[] = {
	0b0000000, // 032 SPACE
	0b0110000, // 033 !
	0b0100010, // 034 "
	0b1000001, // 035 #
	0b1101101, // 036 $
	0b1010010, // 037 %
	0b1111100, // 038 &
	0b0100000, // 039 '
	0b0111001, // 040 (
	0b0001111, // 041 )
	0b0100001, // 042 *
	0b1110000, // 043 +
	0b0001000, // 044 ,
	0b1000000, // 045 -
	0b0001000, // 046 .
	0b1010010, // 047 /
	0b0111111, // 048 0
	0b0000110, // 049 1
	0b1011011, // 050 2
	0b1001111, // 051 3
	0b1100110, // 052 4
	0b1101101, // 053 5
	0b1111101, // 054 6
	0b0000111, // 055 7
	0b1111111, // 056 8
	0b1101111, // 057 9
	0b1001000, // 058 :
	0b1001000, // 059 ;
	0b0111001, // 060 <
	0b1001000, // 061 =
	0b0001111, // 062 >
	0b1010011, // 063 ?
	0b1011111, // 064 @
	0b1110111, // 065 A
	0b1111100, // 066 B
	0b0111001, // 067 C
	0b1011110, // 068 D
	0b1111001, // 069 E
	0b1110001, // 070 F
	0b0111101, // 071 G
	0b1110110, // 072 H
	0b0000110, // 073 I
	0b0011110, // 074 J
	0b1110110, // 075 K
	0b0111000, // 076 L
	0b0010101, // 077 M
	0b0110111, // 078 N
	0b0111111, // 079 O
	0b1110011, // 080 P
	0b1100111, // 081 Q
	0b0110001, // 082 R
	0b1101101, // 083 S
	0b1111000, // 084 T
	0b0111110, // 085 U
	0b0011100, // 086 V
	0b0101010, // 087 W
	0b1110110, // 088 X
	0b1101110, // 089 Y
	0b1011011, // 090 Z
	0b0111001, // 091 [
	0b1100100, // 092 BACKSLASH (Backslash character in code means line continuation)
	0b0001111, // 093 ]
	0b0100011, // 094 ^
	0b0001000, // 095 _
	0b0100000, // 096 `
	0b1110111, // 097 a
	0b1111100, // 098 b
  0b1011000, // 099 c
	0b1011110, // 100 d
	0b1111001, // 101 e
	0b1110001, // 102 f
	0b1101111, // 103 g
	0b1110100, // 104 h
	0b0000100, // 105 i
	0b0011110, // 106 j
	0b1110110, // 107 k
	0b0011000, // 108 l
	0b0010101, // 109 m
	0b1010100, // 110 n
	0b1011100, // 111 o
	0b1110011, // 112 p
	0b1100111, // 113 q
	0b1010000, // 114 r
	0b1101101, // 115 s
	0b1111000, // 116 t
	0b0111110, // 117 u
	0b0011100, // 118 v
	0b0101010, // 119 w
	0b1110110, // 120 x
	0b1101110, // 121 y
	0b1011011, // 122 z
	0b0111001, // 123 {
	0b0110000, // 124 |
	0b0001111, // 125 }
	0b1000000, // 126 ~
	0b0000000, // 127 DEL
	0b1100011  // 128 Degree symbol
};

void s_segment_set_char(s_segment_t segment, char c) {
  s_segment_set_value(segment, segmentMap[c - 32]);
}

char s_segment_get_char(s_segment_t segment) {
  uint8_t val = s_segment_get_value(segment);
  for (int i = 0; i < sizeof(segmentMap); i++) {
    if (val == segmentMap[i]) {
      return (char)i;
    }
  }
  return 0;
}

void s_segment_set_value(s_segment_t segment, uint8_t value) {
  gpio_set_direction(SEVEN_SEGMENT_LOW, 0xFFFFFFFF);
  gpio_set_direction(SEVEN_SEGMENT_HIGH, 0xFFFFFFFF);

  segment_values[segment] = value;
  gpio_write(SEVEN_SEGMENT_LOW, ~s_segment_low_value());
  gpio_write(SEVEN_SEGMENT_HIGH, ~s_segment_high_value());
}

uint8_t s_segment_get_value(s_segment_t segment) {
  return segment_values[segment];
}

uint32_t s_segment_low_value(void) {
  return segment_values[3] << 24 | segment_values[2] << 16 | segment_values[1] << 8 | segment_values[0];
}

uint32_t s_segment_high_value(void) {
  return segment_values[5] << 8 | segment_values[4];
}
