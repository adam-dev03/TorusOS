#include "graphics/buffer.h"
#include "interrupts/idt.h"

extern void init_idt_entry(unsigned int, unsigned int, unsigned short, unsigned char);
extern void init_idt_load(void);

extern void init_PIC();
extern void _isr_0(void);
extern void _isr_1(void);
extern void _isr_2(void);
extern void _isr_3(void);
extern void _isr_4(void);
extern void _isr_5(void);
extern void _isr_6(void);
extern void _isr_7(void);
extern void _isr_8(void);
extern void _isr_9(void);
extern void _isr_10(void);
extern void _isr_11(void);
extern void _isr_12(void);
extern void _isr_13(void);
extern void _isr_14(void);
extern void _isr_15(void);
extern void _isr_16(void);
extern void _isr_17(void);
extern void _isr_18(void);
extern void _isr_19(void);
extern void _isr_20(void);
extern void _isr_21(void);
extern void _isr_22(void);
extern void _isr_23(void);
extern void _isr_24(void);
extern void _isr_25(void);
extern void _isr_26(void);
extern void _isr_27(void);
extern void _isr_28(void);
extern void _isr_29(void);
extern void _isr_30(void);
extern void _isr_31(void);
extern void _isr_32(void);
extern void _isr_33(void);

void main()
{
    init_idt_entry(0, (unsigned)&_isr_0, 0x08, 0x8E);
    init_idt_entry(1, (unsigned)&_isr_1, 0x08, 0x8E);
    init_idt_entry(2, (unsigned)&_isr_2, 0x08, 0x8E);
    init_idt_entry(3, (unsigned)&_isr_3, 0x08, 0x8E);
    init_idt_entry(4, (unsigned)&_isr_4, 0x08, 0x8E);
    init_idt_entry(5, (unsigned)&_isr_5, 0x08, 0x8E);
    init_idt_entry(6, (unsigned)&_isr_6, 0x08, 0x8E);
    init_idt_entry(7, (unsigned)&_isr_7, 0x08, 0x8E);
    init_idt_entry(8, (unsigned)&_isr_8, 0x08, 0x8E);
    init_idt_entry(9, (unsigned)&_isr_9, 0x08, 0x8E);
    init_idt_entry(10, (unsigned)&_isr_10, 0x08, 0x8E);
    init_idt_entry(11, (unsigned)&_isr_11, 0x08, 0x8E);
    init_idt_entry(12, (unsigned)&_isr_12, 0x08, 0x8E);
    init_idt_entry(13, (unsigned)&_isr_13, 0x08, 0x8E);
    init_idt_entry(14, (unsigned)&_isr_14, 0x08, 0x8E);
    init_idt_entry(15, (unsigned)&_isr_15, 0x08, 0x8E);
    init_idt_entry(16, (unsigned)&_isr_16, 0x08, 0x8E);
    init_idt_entry(17, (unsigned)&_isr_17, 0x08, 0x8E);
    init_idt_entry(18, (unsigned)&_isr_18, 0x08, 0x8E);
    init_idt_entry(19, (unsigned)&_isr_19, 0x08, 0x8E);
    init_idt_entry(20, (unsigned)&_isr_20, 0x08, 0x8E);
    init_idt_entry(21, (unsigned)&_isr_21, 0x08, 0x8E);
    init_idt_entry(22, (unsigned)&_isr_22, 0x08, 0x8E);
    init_idt_entry(23, (unsigned)&_isr_23, 0x08, 0x8E);
    init_idt_entry(24, (unsigned)&_isr_24, 0x08, 0x8E);
    init_idt_entry(25, (unsigned)&_isr_25, 0x08, 0x8E);
    init_idt_entry(26, (unsigned)&_isr_26, 0x08, 0x8E);
    init_idt_entry(27, (unsigned)&_isr_27, 0x08, 0x8E);
    init_idt_entry(28, (unsigned)&_isr_28, 0x08, 0x8E);
    init_idt_entry(29, (unsigned)&_isr_29, 0x08, 0x8E);
    init_idt_entry(30, (unsigned)&_isr_30, 0x08, 0x8E);
    init_idt_entry(31, (unsigned)&_isr_31, 0x08, 0x8E);
    init_idt_entry(32, (unsigned)&_isr_32, 0x08, 0x8E);
    init_idt_entry(33, (unsigned)&_isr_33, 0x08, 0x8E);
    init_idt_load();
    init_PIC();

    while (1)
    {
    }
}