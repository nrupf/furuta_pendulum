UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	TARGET_PREFIX = riscv64-unknown-elf
else
	TARGET_PREFIX = /opt/rv32im/bin/riscv32-unknown-elf
endif

# for Linux / WSL:
#TARGET_PREFIX = /opt/rv32im/bin/riscv32-unknown-elf

# for macOS:
#TARGET_PREFIX = riscv64-unknown-elf

CFLAGS :=  -I./include -Werror -nostdlib -march=rv32im_zicsr -mabi=ilp32 -O0 -fno-builtin -ffreestanding -ffunction-sections -fdata-sections -fno-inline -fno-common  -fomit-frame-pointer
#-fomit-frame-pointer -ffreestanding
# -ffunction-sections -fdata-sections -fno-inline -fno-common -ffunction-sections -fdata-sections
#  -nostdlib
	
#-ffunction-sections -fdata-sections -fno-inline -fno-common -ffreestanding -fno-builtin  

CC = $(TARGET_PREFIX)-gcc
AR = $(TARGET_PREFIX)-ar

all:	tinyduino.a

bin/init.o:	src/init.c
	$(CC) $(CFLAGS)  -c src/init.c -o bin/init.o
		
bin/prescaler.o:	src/prescaler.c
	$(CC) $(CFLAGS) -c src/prescaler.c -o bin/prescaler.o
	
bin/printf.o:	src/printf.c
	$(CC) $(CFLAGS) -O3  -c src/printf.c -o bin/printf.o

	
bin/uart.o:	src/uart.c
	$(CC) $(CFLAGS) -O0 -c src/uart.c -o bin/uart.o
	
bin/timer.o:	src/timer.c
	$(CC) $(CFLAGS) -c src/timer.c -o bin/timer.o

bin/gpio.o:	src/gpio.c
	$(CC) $(CFLAGS) -c src/gpio.c -o bin/gpio.o
	


#bin/start.o: src/start.S
#	$(CC) -DCOPY_DATA_TO_RAM -c -o $@ $(TARGET_CFLAGS) $<
	

tinyduino.a: bin/init.o bin/prescaler.o bin/printf.o bin/uart.o bin/timer.o bin/gpio.o
	$(AR) -rc tinyduino.a bin/init.o bin/prescaler.o bin/printf.o bin/uart.o bin/timer.o bin/gpio.o


clean:
	rm -f bin/*.o
	rm -f tinyduino.a
