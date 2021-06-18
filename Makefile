#tonychang1069 @ 2021.06.17

TARGET = aptx4869os.bin
QTARGET = aptx4869os.img

#MAKEFLAGS = -sR
MKDIR = mkdir
RMDIR = rmdir
CP = cp
CD = cd
DD = dd
RM = rm

ASM		= nasm
CC		= gcc
LD		= ld
OBJCOPY	= objcopy

ASMBFLAGS	= -f elf -w-orphan-labels
CFLAGS		= -c -Os -std=c99 -m32 -Wall -Wshadow -W -Wconversion -Wno-sign-conversion  -fno-stack-protector -fomit-frame-pointer -fno-builtin -fno-common  -ffreestanding  -Wno-unused-parameter -Wunused-variable
LDFLAGS		= -s -static -T grub.lds -n -Map grub.map
OJCYFLAGS	= -S -O binary

OBJS = entry.o main.o vgastr.o
ELF = grub.elf
BIN = $(TARGET)

QASMFLAGS   = -f elf32
QCFLAGS     = -c -Os -std=c99 -m32 -Wall -Wextra -Werror -fno-pie -fno-stack-protector -fomit-frame-pointer -fno-builtin -fno-common -ffreestanding
QLDFLAGS    = -s -static -T qemu.ld -n -m elf_i386

QOBJS = qentry.o qmain.o qvgastr.o

.PHONY : build clean all link bin copy qimg clean_after docker docker-image

all: clean build link bin qimg clean_after

clean:
	$(RM) -f *.o *.bin *.img *.elf *.map

build: $(OBJS)

link: $(ELF)
$(ELF): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

bin: $(BIN)
$(BIN): $(ELF)
	$(OBJCOPY) $(OJCYFLAGS) $< $@

copy: $(TARGET)
	sudo $(CP) $< /boot

qimg: $(QTARGET)
$(QTARGET): $(QOBJS)
	$(LD) $(QLDFLAGS) -o $@ $^

clean_after:
	$(RM) -f *.o *.elf *.map

%.o : %.asm
	$(ASM) $(ASMBFLAGS) -o $@ $<
%.o : %.c
	$(CC) $(CFLAGS) -o $@ $<

q%.o : q%.asm
	$(ASM) $(QASMFLAGS) -o $@ $<
q%.o : %.c
	$(CC) $(QCFLAGS) -o $@ $<

