nasm bootloader.asm -f bin -o bootloader.bin
nasm kernel.asm -f bin -o kernel.bin

copy /b bootloader.bin + kernel.bin os.bin
qemu-system-x86_64 -drive format=raw,file=os.bin
pause