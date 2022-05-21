[org 0x0000]
[bits 16]

push 0xAA55
call print_hex

push helloworld
call print

helloworld db "Hello World!", 0x00
%include "dbg.asm"

times 512-($-$$) db 0