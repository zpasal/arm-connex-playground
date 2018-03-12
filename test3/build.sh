arm-none-eabi-gcc -nostdlib -o main.elf -T linker.lds main.c startup.s
arm-none-eabi-nm -n main.elf
arm-none-eabi-objcopy -O binary main.elf main.bin
dd if=/dev/zero of=flash.bin bs=4096 count=4096
dd if=main.bin of=flash.bin bs=4096 conv=notrunc
qemu-system-arm -M connex -pflash flash.bin -monitor stdio
