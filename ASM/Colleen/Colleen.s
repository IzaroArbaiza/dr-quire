section .data
msg:    db "Hello", 10	;"Hello\n"
len:    equ $ - msg		;num of bytes that msg occupies

section .text
global _start
_start:
    mov rax, 1          ;sys_write
    mov rdi, 1          ;fd = stdout
    mov rsi, msg        ;buf
    mov rdx, len        ;count
    syscall

    mov rax, 60         ;sys_exit
    xor rdi, rdi
    syscall
