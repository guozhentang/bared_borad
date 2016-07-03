all:sdram
sdram:
	arm-linux-gcc -c main_loop.c -o main_loop.o
	arm-linux-gcc -c inter.s -o inter.o
	arm-linux-gcc -c inter_hander.c -o inter_hander.o
	arm-linux-ld inter_hander.o main_loop.o inter.o -Ttext 0 -o inter.elf
	arm-linux-objcopy inter.elf -O binary inter.bin
	arm-linux-objdump -D -S inter.elf > inter.S
	@cp -f inter.bin ../bin/
clean:
	rm -rf *.o *.elf *.bin *.S
