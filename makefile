all:leds sdram
sdram:
	arm-linux-gcc -c leds_key.c -o leds_main.o
	arm-linux-gcc -c sdram.s -o sdram.o
	arm-linux-ld sdram.o leds_main.o -Ttext 0x30000000 -o sdram.elf
	arm-linux-objcopy sdram.elf -O binary sdram.bin
	arm-linux-objdump -D -S sdram.elf > sdram.S
leds:
	arm-linux-gcc -c leds.c -o leds_main.o
	arm-linux-gcc -c leds.s -o leds_start.o
	arm-linux-ld leds_start.o leds_main.o -Ttext 0 -o leds.elf
	arm-linux-objcopy leds.elf -O binary leds.bin
clean:
	rm -rf *.o *.elf *.bin *.S
