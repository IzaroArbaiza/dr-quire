section .data
msg: db "section .data", 10, "msg: db ", 34, 34, 10, "len: equ $ - msg", 10, 10, "section .text", 10
len: equ $ - msg		;num of bytes that msg occupies

section .text
global _start

_start:
	mov rax, 1			;sys_write
	mov rdi, 1			;fd = stdout
	mov rsi, msg		;buf
	mov rdx, len		;count
	syscall

	mov rax, 60			;sys_exit
	xor rdi, rdi
	syscall
