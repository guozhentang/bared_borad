all:sdram
sdram:
	arm-linux-gcc -c sdram.c -o sdram_main.o
	arm-linux-gcc -c sdram.s -o sdram.o
	arm-linux-ld sdram.o sdram_main.o -Ttext 0x30000000 -o sdram.elf
	arm-linux-objcopy sdram.elf -O binary sdram.bin
	arm-linux-objdump -D -S sdram.elf > sdram.S
	@cp -f sdram.bin ../bin/
clean:
	rm -rf *.o *.elf *.bin *.S
