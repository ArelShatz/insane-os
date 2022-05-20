[org 0x7C00]
[bits 16]

start:
    lea bx, [helloworld]
    xor si, si
    mov ah, 0x0E

print_loop:
    mov al, BYTE [bx+si]
    cmp al, 0x00
    je end
    push bx
    xor bx, bx
    int 0x10
    pop bx
    inc si
    jmp print_loop

end:

helloworld db "Hello World", 0x0

times 510 - ($-$$) db 0
dw 0xAA55