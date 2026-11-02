    global init_PIC

init_PIC:
    push eax
    mov al, 0x11
    out 0x20,al
    call io_delay
    out 0xA0,al
    call io_delay
    mov al, 0x20
    out 0x21,al
    call io_delay
    mov al, 0x28
    out 0xA1,al
    call io_delay
    mov al,0x4
    out 0x21,al
    call io_delay
    mov al, 0x2
    out 0xA1,al
    call io_delay
    mov al, 0x01
    out 0x21,al
    call io_delay
    out 0xA1,al
    call io_delay
    mov al, 0x00
    out 0x21, al
    call io_delay
    mov al,0x00
    out 0xA1, al
    pop eax





io_delay:
    mov al, 0x11
    out 0x80,al
    ret