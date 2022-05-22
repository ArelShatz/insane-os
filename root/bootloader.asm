[org 0x7C00]
[bits 16]
mov ax, 0x0000
mov ds, ax

cli
mov ss, ax
mov sp, 0x7C00
sti

reset_drive:
    xor ax, ax
    int 0x13

    jc reset_drive

load_kernel:
    push 0x0000
    pop es
    mov bx, 0x7E00
    mov ax, 0x0201
    mov cx, 0x0002
    xor dh, dh
    int 0x13

    jc load_kernel  ;if loading failed try again

execute_kernel:
    xor ax, ax
    mov ds, ax
    mov cs, ax
    mov fs, ax
    mov ss, ax
    mov gs, ax
    mov es, ax

    jmp 0x0000:0x7E00

times 510-($-$$) db 0
dw 0xAA55