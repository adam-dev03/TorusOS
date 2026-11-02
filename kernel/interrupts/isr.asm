	global _isr_0
	global _isr_1
	global _isr_2
	global _isr_3
	global _isr_4
	global _isr_5
	global _isr_6
	global _isr_7
	global _isr_8
	global _isr_9
	global _isr_10
	global _isr_11
	global _isr_12
	global _isr_13
	global _isr_14
	global _isr_15
	global _isr_16
	global _isr_17
	global _isr_18
	global _isr_19
	global _isr_20
	global _isr_21
	global _isr_22
	global _isr_23
	global _isr_24
	global _isr_25
	global _isr_26
	global _isr_27
	global _isr_28
	global _isr_29
	global _isr_30
    global _isr_31
	global _isr_32
	global _isr_33

	extern buffer_char
	extern clr_screen

	extern keyboard_char


_isr_0:
	cli
	push 0
	push 0


_isr_1:
	cli
	push 0
	push 1

jmp exception_common_stub

_isr_2:
	cli
	push 0
	push 2

jmp exception_common_stub

_isr_3:
	cli
	push 0
	push 3

jmp exception_common_stub

_isr_4:
	cli
	push 0
	push 4

jmp exception_common_stub

_isr_5:
	cli
	push 0
	push 5

jmp exception_common_stub

_isr_6:
	cli
	push 0
	push 6

jmp exception_common_stub

_isr_7:
	cli
	push 0
	push 7

jmp exception_common_stub

_isr_8:
	cli
	push 0
	push 8

jmp exception_common_stub

_isr_9:
	cli
	push 0
	push 9

jmp exception_common_stub

_isr_10:
	cli
	push 0
	push 10

jmp exception_common_stub

_isr_11:
	cli
	push 0
	push 11

jmp exception_common_stub

_isr_12:
	cli
	push 0
	push 12

jmp exception_common_stub

_isr_13:
	cli
	push 0
	push 13

jmp exception_common_stub

_isr_14:
	cli
	push 0
	push 14

jmp exception_common_stub

_isr_15:
	cli
	push 0
	push 15

jmp exception_common_stub

_isr_16:
	cli
	push 0
	push 16

jmp exception_common_stub

_isr_17:
	cli
	push 0
	push 17

jmp exception_common_stub

_isr_18:
	cli
	push 0
	push 18

jmp exception_common_stub

_isr_19:
	cli
	push 0
	push 19

jmp exception_common_stub

_isr_20:
	cli
	push 0
	push 20

jmp exception_common_stub

_isr_21:
	cli
	push 0
	push 21

jmp exception_common_stub

_isr_22:
	cli
	push 0
	push 22

jmp exception_common_stub

_isr_23:
	cli
	push 0
	push 23

jmp exception_common_stub

_isr_24:
	cli
	push 0
	push 24

jmp exception_common_stub

_isr_25:
	cli
	push 0
	push 25

jmp exception_common_stub

_isr_26:
	cli
	push 0
	push 26

jmp exception_common_stub

_isr_27:
	cli
	push 0
	push 27

jmp exception_common_stub

_isr_28:
	cli
	push 0
	push 28

jmp exception_common_stub

_isr_29:
	cli
	push 0
	push 29

jmp exception_common_stub

_isr_30:
	cli
	push 0
	push 30

jmp exception_common_stub

_isr_31:
	cli
	push 0
	push 31

jmp exception_common_stub

_isr_32:
	cli
	push 0
	push 32

	jmp exception_common_stub



_isr_33:
	push eax
	push ebx
	cli
	mov ebx,33
	in al, 0x60
	call clr_screen
	push 12
	push 17
	push 17
	push 0x36
	call buffer_char
	jmp irq_common_stub

exception_common_stub:
	pop ebx
	push eax
	mov eax clr_screen
	call eax
	pop eax
	push 12
	push




irq_common_stub:
    pusha
    push ds
    push es
    push fs
    push gs
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov eax, esp
	mov al, 0x20
	sub ebx, 32
	cmp ebx, 7
	jg master
	slave:
		out 0xA0, al
	master:
		out 0x20, al
    pop gs
    pop fs
    pop es
    pop ds
    popa
	pop ebx
	pop eax
    iret