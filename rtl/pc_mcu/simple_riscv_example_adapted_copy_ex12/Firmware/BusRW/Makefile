UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	TARGET_PREFIX = riscv64-unknown-elf
else
	TARGET_PREFIX = /opt/rv32im/bin/riscv32-unknown-elf
endif

# Path to the riscv development tools
#TARGET_PREFIX = /opt/rv32im/bin/riscv32-unknown-elf

TARGET_CC := $(TARGET_PREFIX)-gcc
TARGET_LD := $(TARGET_PREFIX)-gcc
TARGET_SIZE := $(TARGET_PREFIX)-size
TARGET_OBJCOPY := $(TARGET_PREFIX)-objcopy
AS= $(TARGET_PREFIX)-as


TARGET_LDFLAGS =   -march=rv32im_zicsr -mabi=ilp32 -nostartfiles -Wl,--no-relax   -Tvexriscv.ld -Wl,--Map=bootloader.map
TARGET_CFLAGS := -std=gnu99 -march=rv32im_zicsr -mabi=ilp32 -Wno-old-style-declaration -Werror -O0 -fomit-frame-pointer -ffreestanding -fno-builtin -ffunction-sections -fdata-sections -fno-inline -fno-common -I./tinyduino_lib/include


# opbects needed:
OBJECTS :=  start.o main.o

all: bootloader.elf

bootloader.elf: $(OBJECTS)
	make -C tinyduino_lib
	$(TARGET_LD) -o bootloader.elf $(TARGET_LDFLAGS) $(OBJECTS)  tinyduino_lib/tinyduino.a  

clean:
	-$(RM) $(OBJECTS)
	-$(RM) bootloader.elf
	rm -f bootloader.map

# Object file rules:

main.o: main.c
	$(TARGET_CC) -c -o $@ $(TARGET_CFLAGS) $<
	
start.o: start.S
	$(TARGET_CC) $(TARGET_CFLAGS) -c start.S -o start.o

# run openocd to load the software onto the target
run: bootloader.elf
	openocd -f openocd_config/ft2232h-mini-module.cfg -f openocd_config/tiny-duino.cfg  -c "load_image bootloader.elf 0x00000000 elf" -c "resume 0x80000000" -c "shutdown"
