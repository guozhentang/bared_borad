all:leds
leds:
	arm-linux-gcc -c mmu.c -o mmu.o
	arm-linux-gcc -c mmu.s -o mmu_start.o
	arm-linux-ld mmu_start.o mmu.o -Tmmu.lds -o mmu.elf
	arm-linux-objcopy mmu.elf -O binary mmu.bin
	arm-linux-objdump -D -S mmu.elf >mmu.S
	@cp -f mmu.bin ../bin
clean:
	rm -rf *.o *.elf *.bin *.S
