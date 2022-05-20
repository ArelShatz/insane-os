nasm bootloader.asm -f bin -o os.bin
qemu-system-x86_64 -drive format=raw,file=os.bin
pause