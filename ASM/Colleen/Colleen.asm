section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp
    lea rdi, [rel s]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel s]
    xor rax, rax
    call printf wrt ..plt
    leave
    ret

section .data
    s db "section .text%1$c    global main%1$c    extern printf%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    lea rdi, [rel s]%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel s]%1$c    xor rax, rax%1$c    call printf wrt ..plt%1$c    leave%1$c    ret%1$c%1$csection .data%1$c    s db %2$c%3$s%2$c, 0", 0