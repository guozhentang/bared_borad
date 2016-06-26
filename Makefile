all:
	@make -C ./gpio
	@make -C ./sdram
clean:
	@make clean -C ./gpio
	@make clean -C ./sdram
	rm -rf ./bin/*.bin
