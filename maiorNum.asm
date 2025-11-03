segment .data
LF equ 0xA ; Line Feed
NULL equ 0xD ; Finaç da String
SYS_CALL equ 0x80 ; Envia informação ao SO
; EAX
SYS_EXIT equ 0x1 ; Codigo de chamada para finalizar
SYS_READ equ 0x3 ; Operação de leitura
SYS_WRITE equ 0x4 ; Operação de escrita
; EBX
RET_EXIT equ 0x0 ; Operação finalizada com sucesso
STD_IN equ 0x0 ; Leitura do teclado
STD_OUT equ 0x1 ; Escrita na tela

section .data

    ; db (define byte), dw (define word), dd (define doubleword), dq (define quadword), dt (define ten bytes)

    x dd 50 
    y dd 10
    msg1 db "X é maior que Y: ", LF, NULL
    tam1 equ $ - msg1
    msg2 db "Y é maior que X: ", LF, NULL
    tam2 equ $ - msg2

    section .text

    global _start

    _start:
        mov EAX, DWORD[x]
        mov EBX, DWORD[y]
        ; if - comparacao
        cmp EAX, EBX
        ;salto condicional
        jge maior ; EAX >= EBX
        mov ECX, msg2
        mov EDX, tam2 

        ; je = , jg > , jge >= , jl < , jle <= , jne !=
        jmp final
        ; salto incondicional
        ; jmp

        maior:
        mov ECX, msg1
        mov EDX, tam1

        final:
            mov EAX, SYS_WRITE
            mov EBX, STD_OUT
            int SYS_CALL

            mov EAX, SYS_EXIT
            xor EBX, EBX ; mov EBX, RET_EXIT
            int SYS_CALL
