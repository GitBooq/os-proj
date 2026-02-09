BUILD_DIR=../build/os

OS_SRCS := $(wildcard *.asm)
OS_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.bin, $(OS_SRCS))

all: $(OS_OBJS)

$(BUILD_DIR)/%.bin: %.asm
	nasm -f bin $< -o $@

clean:
	rm $(BUILD_DIR)/*
