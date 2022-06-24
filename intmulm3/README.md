
# Installation
- Install the [arm-none-eabi-gcc toolchain](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain) and [st-link](https://github.com/stlink-org/stlink)
- Install a serial terminal
- Download and build gmp (it is used for pre-computation and for reference; not in the main computation)
```
wget https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz
tar -xf gmp-6.2.1.tar.lz
cd gmp-6.2.1
./configure CC=arm-none-eabi-gcc CFLAGS="-nostartfiles --specs=nosys.specs -mcpu=cortex-m3 -Os" --host=arm-none-eabi --disable-assembly
make
```

# Building and running this code

- `make` (in this directory) will produce two binaries: `2048/test.bin` and `4096/test.bin` corresponding to the 2048-bit and 4096-bit multiplications respectively
- `make flash-2048` uses st-flash to write the binary to the board
- We use the UART built into the st-link to communicate with the host. After identifying the device name, you can for example use [pyserial-miniterm](https://pyserial.readthedocs.io/en/latest/) to receive
the output:
```
# Start a serial console to the /dev/ttyACM0 device with a baud rate of 9600.

 pyserial-miniterm /dev/ttyACM0 9600

# Use Ctrl+] to exit the console
```


# Sample Output
```
================
NBITS:                                        2048
-- Individual functions
chunk:                                         738 cycles
lower:                                        1202 cycles
dechunk:                                      1855 cycles
crt:                                          5337 cycles
ntt_q1:                                      12409 cycles
ntt_pre_q1:                                  14692 cycles
intt_q1:                                     15132 cycles
basemul_q1:                                   7053 cycles
basemul_pre_q1:                               6102 cycles
basesqr_q1:                                   5947 cycles
ntt_q2:                                       7633 cycles
ntt_pre_q2:                                   9631 cycles
intt_q2:                                     11090 cycles
basemul_q2:                                   7180 cycles
basemul_pre_q2:                               6487 cycles
basesqr_q2:                                   5563 cycles
add_high:                                      658 cycles
tbl_lookup:                                  14027 cycles
-- Sums (estimated cycle counts)
mulmod (w/ NTT of b)  sum:                  222040 cycles
    3x chunk:                                 2214 cycles
    2x dechunk:                               3710 cycles
    1x lower:                                 1202 cycles
    3x crt:                                  16011 cycles
    4x ntt_q1:                               49636 cycles
    4x intt_q1:                              45396 cycles
    1x basemul_q1:                            7053 cycles
    2x basemul_pre_q1:                       12204 cycles
    4x ntt_q2:                               30532 cycles
    3x ifnt_q2:                              33270 cycles
    1x basemul_q2:                            7180 cycles
    2x basemul_pre_q2:                       12974 cycles
    1x add_high:                               658 cycles

mulmod (b precomp) sum:                     199616 cycles
    2x chunk:                                 1476 cycles
    2x dechunk:                               3710 cycles
    1x lower:                                 1202 cycles
    3x crt:                                  16011 cycles
    3x ntt_q1:                               37227 cycles
    3x intt_q1:                              45396 cycles
    3x basemul_pre_q1:                       18306 cycles
    3x ntt_q2:                               22899 cycles
    3x ifnt_q2:                              33270 cycles
    3x basemul_pre_q2:                       19461 cycles
    1x add_high:                               658 cycles

sqrmod sum:                                 198537 cycles
    2x chunk:                                 1476 cycles
    2x dechunk:                               3710 cycles
    1x lower:                                 1202 cycles
    3x crt:                                  16011 cycles
    3x ntt_q2:                               22899 cycles
    3x intt_q2:                              33270 cycles
    2x basemul_pre_q2:                       12974 cycles
    1x basesqr_q2:                            5563 cycles
    3x ntt_q1:                               37227 cycles
    3x intt_q1:                              45396 cycles
    2x basemul_pre_q1:                       12204 cycles
    1x basesqr_q1:                            5947 cycles
    1x add_high:                               658 cycles
-- actual benchmarks
mulmod (w/ NTT of b):                       220046 cycles
OK
mulmod (b precomputed):                     197906 cycles
OK
sqrmod:                                     196830 cycles
OK
table lookup:                                14027 cycles
OK
running expmod (public-key version) now...
expmod (public):                           4227472 cycles
OK
running expmod (private-key version) now... you may want to grab a coffee...
expmod (private):                        494923449 cycles
OK
#################
OK
#################
```