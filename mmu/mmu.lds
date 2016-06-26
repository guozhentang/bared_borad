SECTIONS{
	first	0x00000000	:	{mmu_start.o}
	second	0xB1000000	:	AT(2048){mmu.o}
}
