; nasm -f elf64 hello.asm
; Linkeditar: Transfomar o programa em linguagem de maquina para executavel
; ld -s -o hello hello.o
section .data
    msg db 'Hello, World!',0xA
    len equ $ - msg
section .text

global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 0x1 ; 0 1 2 3 4 5 6 7 8 9 A B C D E F
    mov ebx, 0x0
    int 0x80
 