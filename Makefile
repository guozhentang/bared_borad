all:
	@make -C ./gpio
	@make -C ./sdram
	@make -C ./mmu
	@make -C ./nand
clean:
	@make clean -C ./gpio
	@make clean -C ./sdram
	@make clean -C ./mmu
	@make clean -C ./nand
	rm -rf ./bin/*.bin
