PREFIX	?= arm-none-eabi
CC		= $(PREFIX)-gcc
LD		= $(PREFIX)-gcc
OBJCOPY	= $(PREFIX)-objcopy
OBJDUMP	= $(PREFIX)-objdump
GDB		= $(PREFIX)-gdb
OPENCM3_DIR =../libopencm3


DEVICE=stm32f207zg
LIBNAME= opencm3_stm32f2
ARCH_FLAGS = -mthumb -mcpu=cortex-m3

GMP_DIR=./gmp-6.2.1/
GMP_LIB=$(GMP_DIR)/.libs/libgmp.a

DEFINES=-DSTM32F2 -DSTM32F207ZG

CFLAGS		+= -O3\
		   -Wall -Wextra -Wimplicit-function-declaration \
		   -Wredundant-decls -Wmissing-prototypes -Wstrict-prototypes \
		   -Wundef -Wshadow \
		   -I$(OPENCM3_DIR)/include \
		   -I$(GMP_DIR) \
		   -fno-common $(ARCH_FLAGS) -MD $(DEFINES)

DEVICES_DATA = $(OPENCM3_DIR)/ld/devices.data
LDSCRIPT = stm32f207zg.ld

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

OBJS_MLA=hal-opencm3.o test.o hensel.o hensel32.o arith.S mla.o mla-low.o
OBJS_UMLAL=hal-opencm3.o test.o hensel.o hensel32.o arith.S umlal.o umlal-low.o

all: mla.bin umlal.bin


%.bin: %.elf
	$(OBJCOPY) -Obinary $(*).elf $(*).bin

mla.elf: $(OBJS_MLA) $(LDSCRIPT) $(GMP_LIB)
	$(LD) -o $@ $(OBJS_MLA) $(LDFLAGS) -l$(LIBNAME)

umlal.elf: $(OBJS_UMLAL) $(LDSCRIPT) $(GMP_LIB)
	$(LD) -o $@ $(OBJS_UMLAL) $(LDFLAGS) -l$(LIBNAME)

%.o: %.c $(GMP_LIB)
	$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.S
	$(CC) $(CFLAGS) -o $@ -c $<

$(GMP_LIB):
	@if [ ! "`ls -A $(GMP_DIR)`" ] ; then \
		printf "######## ERROR ########\n"; \
		printf "\tgmp is not installed.\n"; \
		printf "\tPlease run:\n"; \
		printf "\t$$ wget https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz\n"; \
		printf "\t$$ tar -xf gmp-6.2.1.tar.lz\n"; \
		printf "\t$$ cd gmp-6.2.1\n"; \
		printf "\t$$ ./configure CC=arm-none-eabi-gcc CFLAGS="-nostartfiles --specs=nosys.specs -mcpu=cortex-m3 -O3" --host=arm-none-eabi --disable-assembly\n"; \
		printf "\t$$ make\n"; \
		printf "\tbefore running make.\n"; \
		exit 1; \
	fi

clean:
	find . -name \*.o -type f -exec rm -f {} \;
	find . -name \*.d -type f -exec rm -f {} \;
	rm -f *.elf
	rm -f *.bin
	rm -rf obj/