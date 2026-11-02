run:
	nasm -f bin bootloader/bootloader.asm -o bin/bootloader.bin

	nasm -f elf32 kernel/kernel_entry.asm -o bin/kernel_entry.o
	nasm -f elf32 kernel/interrupts/idt_load.asm -o bin/idt_load.o
	nasm -f elf32 kernel/interrupts/isr.asm -o bin/isr.o
	nasm -f elf32 kernel/interrupts/PIC.asm -o bin/PIC.o
	gcc -m32 -ffreestanding -fno-pie -fno-stack-protector -nostdlib -c kernel/kernel.c -o bin/kernel.o

	ld -m elf_i386 -Ttext 0x1000 bin/kernel_entry.o bin/kernel.o bin/idt_load.o bin/isr.o bin/idt.o -o bin/kernel.bin bin/PIC.o --oformat binary

	cat bin/bootloader.bin bin/kernel.bin > bin/torusos.img
	truncate -s 1440k bin/torusos.img
	qemu-system-i386 -drive format=raw,file=bin/torusos.img -display vnc=127.0.0.1:0
clear_bin:
	rm -rf ./bin/*
