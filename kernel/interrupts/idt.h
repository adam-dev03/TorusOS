
extern void load_idt(void);

struct idt
{
    short offset_1;
    short segment_selector;
    char zero;
    char access_byte;
    short offset_2;
} __attribute__((packed));

struct idt_descriptor
{
    unsigned short limit;
    unsigned int base;
} __attribute__((packed));

struct idt_descriptor IDT_POINTER;

struct idt IDT[256];

void init_idt_entry(unsigned int num, unsigned int base, unsigned short sel, unsigned char flags)
{
    IDT[num].offset_1 = (short)((int)base & 0xFFFF);
    IDT[num].offset_2 = (short)(((int)base >> 16) & 0xFFFF);
    IDT[num].zero = 0X00;
    IDT[num].segment_selector = sel;
    IDT[num].access_byte = flags;
}

void init_idt_load()
{
    IDT_POINTER.limit = (sizeof(struct idt) * 256) - 1;
    IDT_POINTER.base = (unsigned int)&IDT[0];
    load_idt();
}
