section .text
global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, s
    mov rdx, 333
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, q
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s
    mov rdx, 333
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, q
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

section .data
q db 96
s db "section .text", 10, "global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, s
    mov rdx, 333
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, q
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, s
    mov rdx, 333
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, q
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

section .data
q db 96
s db "