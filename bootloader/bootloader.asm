	[BITS 16]
	[org 0x7C00]

	CODE_SEGMENT equ code_segment_descriptor - GDT_start
	DATA_SEGMENT equ data_segment_descriptor - GDT_start

init_regs:
	xor ax, ax
	mov es, ax
	mov ds, ax
	mov bp, 0x8000
	mov sp, bp

read_disk:
	mov [DISK_NUMBER], dl        ; Pointer for the disk number
	mov ah, 2                    ; Disk read parameter for the BIOS interrupt
	mov al, 25                   ; Number of sectors to read from
	mov ch, 0                    ; Cylinder number
	mov cl, 2                    ; Sector number
	mov dh, 0                    ; Head number
	mov dl, [DISK_NUMBER]        ; Disk number
	mov bx, 0x1000
	int 0x13

load_PM:                      ; PM stands for Protected Mode
	cli
	lgdt [GDT_descriptor]
	mov eax, cr0
	or eax, 1
	mov cr0, eax
jmp CODE_SEGMENT:PM_code
	jmp $

GDT_start:

null_segment_descriptor:
	dd 0x00000000
	dd 0x00000000

code_segment_descriptor:
	dw 0xFFFF                    ; Limit
	dw 0x0000                    ; Base
	db 0x0                       ; Base
	db 10011010b                 ; Access byte
	db 11001111b                 ; Flags
	db 0x0                       ; Base

data_segment_descriptor:
	dw 0xFFFF                    ; Limit
	dw 0x0000                    ; Base
	db 0x0                       ; Base
	db 10010010b                 ; Access byte
	db 11001111b                 ; Flags
	db 0x0                       ; Base

GDT_end:

GDT_descriptor:
	dw GDT_end - GDT_start - 1   ; Size
	dd GDT_start                 ; Base

disk_num:
	DISK_NUMBER db 0

	[BITS 32]
PM_code:
init_seg_reg:
	mov ax, DATA_SEGMENT
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

init_stack_reg:
	mov ebp, 0x90000
	mov esp, ebp

kernel_jmp:
	jmp 0x1000

end:

	times 510 - ($ - $$) db 0
	dw 0xaa55
