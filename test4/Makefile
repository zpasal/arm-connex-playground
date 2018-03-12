include ./makefile.conf
STARTUP_DEFS=-D__STARTUP_CLEAR_BSS -D__START=main
NAME=main
LDSCRIPTS=-T$(BASE)/ldscripts/linker.ld
LFLAGS=$(LDSCRIPTS) $(GC) $(MAP)
ELF=dist/$(NAME).elf
BIN=dist/$(NAME).bin
FLASH=dist/flash.bin

$(ELF): $(NAME).c $(STARTUP)
	mkdir -p dist
	$(CC) $^ $(CFLAGS) $(LFLAGS) -o $@
	$(NM) -n $(ELF)

flash: $(ELF)
	arm-none-eabi-objcopy -O binary $(ELF) $(BIN)
	dd if=/dev/zero of=$(FLASH) bs=4096 count=4096
	dd if=$(BIN) of=$(FLASH) bs=4096 conv=notrunc

run: flash
	qemu-system-arm -M connex -pflash $(FLASH) -monitor stdio

clean: 
	rm -f $(NAME)*.elf *.map *.o *.bin
	rm -rf dist
