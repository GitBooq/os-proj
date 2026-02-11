BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.bin, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

$(BUILD_DIR)/%.bin: %.asm
	nasm -f elf $< -F dwarf -g -o $@
	ld -m elf_i386 -T bootloader.lds $@ -o $@.elf
	objcopy -O binary $(BUILD_DIR)/bootloader.bin.elf $@

clean:
	rm $(BUILD_DIR)/*
