PREFIX	?= arm-none-eabi
CC		= $(PREFIX)-gcc
LD		= $(PREFIX)-gcc
OBJCOPY	= $(PREFIX)-objcopy
OBJDUMP	= $(PREFIX)-objdump
GDB		= $(PREFIX)-gdb
OPENCM3_DIR =../libopencm3

HEADERS=crt.h gmpwrap.h hal.h helper.h ntt.h nttmulmod.h params.h randombytes.h

ASM_DIR=asm

GMP_DIR=./gmp-6.2.1/
GMP_LIB=$(GMP_DIR)/.libs/libgmp.a

DEVICE=stm32f207zg
LIBNAME= opencm3_stm32f2
ARCH_FLAGS = -mthumb -mcpu=cortex-m3

DEFINES=-DSTM32F2 -DSTM32F207ZG

CFLAGS		+= -O3\
						-fstack-usage \
		   -Wall -Wextra -Wimplicit-function-declaration -Wno-pointer-sign\
		   -Wredundant-decls -Wmissing-prototypes -Wstrict-prototypes \
		   -Wundef -Wshadow \
		   -I$(OPENCM3_DIR)/include \
		   -I$(GMP_DIR) \
		   -fno-common $(ARCH_FLAGS) -MD $(DEFINES)

DEVICES_DATA = $(OPENCM3_DIR)/ld/devices.data
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
	-Wl,--gc-sections -fno-builtin -ffunction-sections -fdata-sections \
	-T$(LDSCRIPT) \
	$(ARCH_FLAGS)

OBJS=hal-opencm3.o test.o nttmulmod.o nttexpmod.o randombytes.o gmpwrap.o high.o tbl_lookup.o
OBJS_2048=$(patsubst %.o,2048/%.o, $(OBJS))
OBJS_2048 += asm/2048/chunk.o
OBJS_2048 += asm/2048/dechunk.o
OBJS_2048 += asm/2048/crt.o
OBJS_2048 += asm/2048/lower.o
OBJS_2048 += asm/2048/12289/intt.o
OBJS_2048 += asm/2048/12289/mul_pre.o
OBJS_2048 += asm/2048/12289/mul.o
OBJS_2048 += asm/2048/12289/ntt_pre.o
OBJS_2048 += asm/2048/12289/ntt.o
OBJS_2048 += asm/2048/12289/sqr.o
OBJS_2048 += asm/2048/65537/intt.o
OBJS_2048 += asm/2048/65537/mul_pre.o
OBJS_2048 += asm/2048/65537/mul.o
OBJS_2048 += asm/2048/65537/ntt_pre.o
OBJS_2048 += asm/2048/65537/ntt.o
OBJS_2048 += asm/2048/65537/sqr.o
OBJS_4096=$(patsubst %.o,4096/%.o, $(OBJS))
OBJS_4096 += asm/4096/chunk.o
OBJS_4096 += asm/4096/dechunk.o
OBJS_4096 += asm/4096/crt.o
OBJS_4096 += asm/4096/lower.o
OBJS_4096 += asm/4096/25601/intt.o
OBJS_4096 += asm/4096/25601/mul_pre.o
OBJS_4096 += asm/4096/25601/mul.o
OBJS_4096 += asm/4096/25601/ntt_pre.o
OBJS_4096 += asm/4096/25601/ntt.o
OBJS_4096 += asm/4096/25601/sqr.o
OBJS_4096 += asm/4096/65537/intt.o
OBJS_4096 += asm/4096/65537/mul_pre.o
OBJS_4096 += asm/4096/65537/mul.o
OBJS_4096 += asm/4096/65537/ntt_pre.o
OBJS_4096 += asm/4096/65537/ntt.o
OBJS_4096 += asm/4096/65537/sqr.o



all: 2048/test.bin 4096/test.bin

.PHONY: flash-2048 flash-4096
flash-2048: 2048/test.bin
	st-flash write 2048/test.bin 0x8000000
flash-4096: 4096/test.bin
	st-flash write 4096/test.bin 0x8000000

%.bin: %.elf
	$(OBJCOPY) -Obinary $< $@

2048/%.elf: $(ASM_DIR)/2048/ 2048/%.o $(OBJS_2048) $(LDSCRIPT) $(LIBDEPS) $(GMP_LIB)
	mkdir -p 2048/
	$(LD) -o $@ $(OBJS_2048) $(LDFLAGS) -l$(LIBNAME)

4096/%.elf: $(ASM_DIR)/4096/ 4096/%.o $(OBJS_4096) $(LDSCRIPT) $(LIBDEPS) $(GMP_LIB)
	mkdir -p 4096/
	$(LD) -o $@ $(OBJS_4096) $(LDFLAGS) -l$(LIBNAME)

2048/%.o: %.c $(HEADERS)
	mkdir -p 2048/
	$(CC) -DNBITS=2048 $(CFLAGS) -o $@ -c $<

4096/%.o: %.c $(HEADERS)
	mkdir -p 4096/
	$(CC) -DNBITS=4096 $(CFLAGS) -o $@ -c $<


2048/%.o: 2048/%.S $(HEADERS)
	mkdir -p 2048/
	$(CC) -DNBITS=2048 $(CFLAGS) -o $@ -c $<

4096/%.o: 4096/%.S $(HEADERS)
	mkdir -p 4096/
	$(CC) -DNBITS=4096 $(CFLAGS) -o $@ -c $<


asm/%.o: asm/%.S $(HEADERS)
	$(CC) $(CFLAGS) -o $@ -c $<


2048/high.o: high.S $(HEADERS)
	mkdir -p 2048/
	$(CC) -DNBITS=2048 $(CFLAGS) -o $@ -c $<

4096/high.o: high.S $(HEADERS)
	mkdir -p 4096/
	$(CC) -DNBITS=4096 $(CFLAGS) -o $@ -c $<

2048/tbl_lookup.o: tbl_lookup.S $(HEADERS)
	mkdir -p 2048/
	$(CC) -DNBITS=2048 $(CFLAGS) -o $@ -c $<

4096/tbl_lookup.o: tbl_lookup.S $(HEADERS)
	mkdir -p 4096/
	$(CC) -DNBITS=4096 $(CFLAGS) -o $@ -c $<


$(LIBDEPS):
	$(MAKE) -C $(OPENCM3_DIR)

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

libclean: clean
	$(MAKE) -C $(ASM_DIR) clean

clean:
	find . -name \*.o -type f -exec rm {} \;
	find . -name \*.d -type f -exec rm {} \;
	rm -f *.elf */*.elf
	rm -f *.bin */*.bin
	rm -rf 2048 4096
