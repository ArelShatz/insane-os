nasm root/bootloader.asm -f bin -o root/bootloader.bin
nasm root/kernel.asm -f bin -o root/kernel.bin

copy /b root\bootloader.bin + root\kernel.bin root\os.bin
qemu-system-x86_64 -drive format=raw,file=root/os.bin
pause