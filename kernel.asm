[org 0x0000]
[bits 16]

kernel_boot:
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

helloworld: db "Hello World", 0x00

times 512-($-$$) db 0