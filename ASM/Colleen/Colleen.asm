section .text
    global main
    extern printf

; Colleen - a simple quine that prints itself.

main:
    push rbp
    mov rbp, rsp
    lea rdi, [rel s]
    mov rsi, 10        ; %1$c = newline
    mov rdx, 34        ; %2$c = "
    lea rcx, [rel s]   ; %3$s = string itself
    mov r8, 9          ; %4$c = tab
    xor rax, rax
    call printf wrt ..plt

    xor rax, rax       ; return 0
    leave
    ret

section .data
    s db "section .text%1$c
%4$cglobal main%1$c
%4$cextern printf%1$c
%1$c
; Colleen - a simple quine that prints itself.%1$c
%1$c
main:%1$c
%4$cpush rbp%1$c
%4$cmov rbp, rsp%1$c
%4$clea rdi, [rel s]%1$c
%4$cmov rsi, 10%1$c
%4$cmov rdx, 34%1$c
%4$clea rcx, [rel s]%1$c
%4$cmov r8, 9%1$c
%4$cxor rax, rax%1$c
%4$ccall printf wrt ..plt%1$c
%1$c
%4$cxor rax, rax%1$c
%4$cleave%1$c
%4$cret%1$c
%1$c
section .data%1$c
%4$cs db %2$c%3$s%2$c, 0", 0