# ARM Connex board playground

## Install
* Install arm-none-eabi toolchain for mac ([GNU Arm Embedded Toolchain | Downloads – Arm Developer](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads))
* Install qemu 
	* `brew install qemu`


## Quick start
* Go to test1(2 or 3) folder
* Run  build.sh

## Examples

#### Test1 
Simple asm file that adds two numbers and store in register.

#### Test2
Simple asm file that copy .data from flash to RAM and adds them. Result is stored in RAM.

#### Test3
Integration with .asm and .c files. Handling of gcc specific sections (.text, .data, .rodata, .bss,). Special handling
foir interapt vectors.

#### Test4
Same as test3 but with proper makefile. To run type `make run`.

Make targets:

* `make` to build main.elf
* `make flash` to build flash binary (flash.bin)
* `make run` to run qemu
