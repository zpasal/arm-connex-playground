arm-none-eabi-as -o main.o main.s 
arm-none-eabi-ld -T linker.lds -o main.elf main.o
arm-none-eabi-nm -n main.elf
arm-none-eabi-objcopy -O binary main.elf main.bin
dd if=/dev/zero of=flash.bin bs=4096 count=4096
dd if=main.bin of=flash.bin bs=4096 conv=notrunc
qemu-system-arm -M connex -pflash flash.bin -monitor stdio
