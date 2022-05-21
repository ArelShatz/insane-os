[bits 16]
;input: stack0 - string buffer | output: none
print:
    push bp
    mov bp, sp
    mov bx, [bp+4]
    xor si, si
    mov ah, 0x0E

print_str_loop:
    mov al, BYTE [bx+si]
    cmp al, 0x00
    je end
    push bx
    xor bx, bx
    int 0x10
    pop bx
    inc si
    jmp print_str_loop

end_str:
    pop bp
    ret 2



;input: stack0 - hex buffer | output: none
print_hex:
    push bp
    mov bp, sp
    mov di, [bp+4]
    xor bx, bx
    mov ah, 0x0E

    mov al, "0"
    int 0x10

    mov al, "x"
    int 0x10

    mov cl, 12
    mov si, 0xF000   ;mask to extract a nibble every time

print_hex_loop:
    cmp si, 0x0000
    je end_hex
    mov dx, di
    and dx, si
    shr dx, cl
    cmp dl, 0x0A
    jl digit
    add dl, 0x37
    jmp fin

digit:
    or dl, 0x30

fin:
    mov al, dl
    int 0x10
    sub cl, 4
    shr si, 4
    jmp print_hex_loop

end_hex:
    pop bp
    ret 2