	[extern IDT_POINTER]

	[bits 32]
	global load_idt

load_idt:
	lidt [IDT_POINTER]
	ret
