ASM = yasm
ASMFLAGS = -f elf64 -g dwarf2
LD = ld

SRCS = bx.asm include/itos.asm include/print.asm include/stoi.asm include/strlen.asm
OBJS = $(SRCS:.asm=.o)

all: bx

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

bx: $(OBJS)
	$(LD) -o $@ $(OBJS)

clean:
	rm -f $(OBJS)
