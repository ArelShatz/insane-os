gdt_start:
null_descriptor:
    dd 0x0000
    dd 0x0000

code_descriptor:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x9A
    db 011001111b
    db 0x00

data_descriptor:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x92
    db 011001111b
    db 0x00

gdt_end:
gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start


CODE_SEG equ code_descriptor - gdt_start
DATA_SEG equ data_descriptor - gdt_start