#ifndef _IO_H_
#define _IO_H_

#define CORE_HZ 50000000

#define GPIO_A              ((Gpio_Reg*)(0xF0000000))
#define GPIO_B              ((Gpio_Reg*)(0xF0001000))
#define GPIO_C              ((Gpio_Reg*)(0xF0002000))
#define SEVEN_SEGMENT_LOW   ((Gpio_Reg*)(0xF0003000))
#define SEVEN_SEGMENT_HIGH  ((Gpio_Reg*)(0xF0004000))
#define UART                ((Uart_Reg*)(0xF0010000))

#define TIMER_PRESCALER     ((Prescaler_Reg*)0xF0020000)
#define TIMER_INTERRUPT     ((TimerInterruptCtrl_Reg*)0xF0020010)
#define TIMER_A_BASE        ((Timer_Reg*)0xF0020040)
#define TIMER_B_BASE        ((Timer_Reg*)0xF0020050)
#define TIMER_C_BASE        ((Timer_Reg*)0xF0020060)
#define TIMER_D_BASE        ((Timer_Reg*)0xF0020070)

#endif
