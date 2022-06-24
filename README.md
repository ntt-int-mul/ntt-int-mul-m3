This repository accompanies the paper **Efficient Multiplication of Somewhat Small Integers using Number-Theoretic Transforms** available at https://eprint.iacr.org/2022/439.


Authors:
 - Hanno Becker `<hanno.becker@arm.com>`
 - Vincent Hwang `<vincentvbh7@gmail.com>`
 - [Matthias J. Kannwischer](https://kannwischer.eu/) `<matthias@kannwischer.eu>`
 - [Lorenz Panny](https://yx7.cc/) `<lorenz@yx7.cc>`
 - [Bo-Yin Yang](https://homepage.iis.sinica.edu.tw/pages/byyang/) `<by@crypto.tw>`

It contains the Cortex-M3 implementation of the NTT-based integer multiplier,
the schoolbook multiplication (using finely-integrated operand scanning),
and the Hensel lifting.
The Cortex-M55 code will be published at a later point [here](https://gitlab.com/arm-research/security/pqmx).


Clone the code including the submodules using

```
git clone --recurse-submodules https://github.com/ntt-int-mul/ntt-int-mul-m3
```

# Hardware

We use the [Nucleo STM32F207ZG](https://www.st.com/en/evaluation-tools/nucleo-f207zg.html).


# Software
For building the software, we use the [arm-none-eabi-gcc toolchain](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain).
For flashing binaries, we use [st-link](https://github.com/stlink-org/stlink).

# Structure
- [`intmulm3`](./intmulm3/) contains the NTT-based integer multiplier. Refer to the [README.md](./intmulm3/README.md)
- [`schoolbookm3`](./schoolbookm3/) contains the schoolbook multiplier for reference. Refer to the [README.md](./schoolbookm3/README.md)
- [`hensel-lifting-m3`](./hensel-lifting-m3/) contains Hensel lifting. Refer to the [README.md](./hensel-lifting-m3/README.md)

# License
All files in this repository are published under a [CC0 copyright-waiver](https://creativecommons.org/share-your-work/public-domain/cc0/).
