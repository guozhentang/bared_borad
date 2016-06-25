all:leds
leds:
	arm-linux-gcc -c leds_key.c -o leds_main.o
	arm-linux-gcc -c leds_key.s -o leds_start.o
	arm-linux-ld leds_start.o leds_main.o -Ttext 0 -o leds_key.elf
	arm-linux-objcopy leds_key.elf -O binary leds_key.bin
	arm-linux-objdump -D -S leds_key.elf >leds_key.S
	@cp -f leds_key.bin ../bin
clean:
	rm -rf *.o *.elf *.bin *.S
