[org 0x7E00]
[bits 16]

kernel_boot:
enter_32bit_pm:
    cli
    lgdt [gdt_descriptor]

    smsw ax
    or ax, 0x01    ;enable PE bit
    lmsw ax

    jmp CODE_SEG:pm_32bit_activated   ;flush CPU cache


[bits 32]
pm_32bit_activated:
    mov ax, DATA_SEG    ;point every segment register into the data segment (no segmentation in pm)
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax


helloworld db "Hello World", 0x00
%include "root/entry_32pm.asm"
%include "root/dbg.asm"

times 512-($-$$) db 0