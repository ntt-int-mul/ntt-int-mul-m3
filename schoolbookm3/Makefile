PREFIX	?= arm-none-eabi
CC		= $(PREFIX)-gcc
LD		= $(PREFIX)-gcc
OBJCOPY	= $(PREFIX)-objcopy
OBJDUMP	= $(PREFIX)-objdump
GDB		= $(PREFIX)-gdb
OPENCM3_DIR =../libopencm3

GMP_DIR=./gmp-6.2.1/
GMP_LIB=$(GMP_DIR)/.libs/libgmp.a


DEVICE=stm32f207zg
LIBNAME= opencm3_stm32f2
ARCH_FLAGS = -mthumb -mcpu=cortex-m3

DEFINES=-DSTM32F2 -DSTM32F207ZG

CFLAGS		+= -O3\
		   -Wall -Wextra -Wimplicit-function-declaration \
		   -Wredundant-decls -Wmissing-prototypes -Wstrict-prototypes \
		   -Wundef -Wshadow \
		   -I$(OPENCM3_DIR)/include \
		   -I$(GMP_DIR) \
		   -fno-common $(ARCH_FLAGS) -MD $(DEFINES)

LDSCRIPT = $(DEVICE).ld

LDLIBS += -l$(LIBNAME)
LIBDEPS += $(OPENCM3_DIR)/lib/lib$(LIBNAME).a

LDFLAGS += -L$(OPENCM3_DIR)/lib
LDFLAGS += \
	-L$(GMP_DIR)/.libs/ -lgmp \
	--specs=nosys.specs \
	-Wl,--wrap=_sbrk \
	-nostartfiles \
	-ffreestanding \
	-T$(LDSCRIPT) \
	$(ARCH_FLAGS)

OBJS=hal-opencm3.o test.o mont_mul.o randombytes.o gmpwrap.o schoolbook_mulmod.o tbl_lookup.o

all: 2048/test.bin 4096/test.bin
OBJS_2048=$(patsubst %.o,2048/%.o, $(OBJS))
OBJS_4096=$(patsubst %.o,4096/%.o, $(OBJS))


.PHONY: flash-2048 flash-4096
flash-2048: 2048/test.bin
	st-flash write 2048/test.bin 0x8000000
flash-4096: 4096/test.bin
	st-flash write 4096/test.bin 0x8000000

%.bin: %.elf
	$(OBJCOPY) -Obinary $(*).elf $(*).bin

2048/%.elf: 2048/%.o $(OBJS_2048) $(LDSCRIPT) $(GMP_LIB)
	mkdir -p 2048/
	$(LD) -o $@ $(OBJS_2048) $(LDFLAGS) -l$(LIBNAME)

4096/%.elf: 4096/%.o $(OBJS_4096) $(LDSCRIPT) $(GMP_LIB)
	mkdir -p 4096/
	$(LD) -o $@ $(OBJS_4096) $(LDFLAGS) -l$(LIBNAME)

2048/%.o: %.c $(GMP_LIB)
	mkdir -p 2048/
	$(CC) -DNBITS=2048 $(CFLAGS) -o $@ -c $<

4096/%.o: %.c $(GMP_LIB)
	mkdir -p 4096/
	$(CC) -DNBITS=4096  $(CFLAGS) -o $@ -c $<

2048/%.o: %.S
	mkdir -p 2048/
	$(CC) -DNBITS=2048 $(CFLAGS) -o $@ -c $<

4096/%.o: %.S
	mkdir -p 4096/
	$(CC) -DNBITS=4096  $(CFLAGS) -o $@ -c $<


$(GMP_LIB):
	@if [ ! "`ls -A $(GMP_DIR)`" ] ; then \
		printf "######## ERROR ########\n"; \
		printf "\tgmp is not installed.\n"; \
		printf "\tPlease run:\n"; \
		printf "\t$$ wget https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz\n"; \
		printf "\t$$ tar -xf gmp-6.2.1.tar.lz\n"; \
		printf "\t$$ cd gmp-6.2.1\n"; \
		printf '\t$$ ./configure CC=arm-none-eabi-gcc CFLAGS="-nostartfiles --specs=nosys.specs -mcpu=cortex-m3 -Os" --host=arm-none-eabi --disable-assembly\n'; \
		printf "\t$$ make\n"; \
		printf "\tbefore running make.\n"; \
		exit 1; \
	fi

clean:
	find . -name \*.o -type f -exec rm -f {} \;
	find . -name \*.d -type f -exec rm -f {} \;
	rm -f *.elf */*.elf
	rm -f *.bin */*.bin