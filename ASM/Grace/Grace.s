%macro OPEN 0
	mov rax, 2
	mov rdi, file
	mov rsi, 65
	mov rdx, 0644o
	syscall
%endmacro

%macro WRITE 0
	push rbp
	mov rdi, rax
	mov rsi, code
	mov rdx, 10
	mov rcx, 34
	mov r8, code
	mov r9, 9
	xor rax, rax
	call dprintf wrt ..plt
	pop rbp
%endmacro

%macro EXIT 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro

section .text
	global main
	extern dprintf

;Grace - self-replicating program using macros only.

main:
	OPEN
	WRITE
	EXIT

section .data
	file db "Grace_kid.s", 0
	code db "%%macro OPEN 0%1$c%4$cmov rax, 2%1$c%4$cmov rdi, file%1$c%4$cmov rsi, 65%1$c%4$cmov rdx, 0644o%1$c%4$csyscall%1$c%%endmacro%1$c%1$c%%macro WRITE 0%1$c%4$cpush rbp%1$c%4$cmov rdi, rax%1$c%4$cmov rsi, code%1$c%4$cmov rdx, 10%1$c%4$cmov rcx, 34%1$c%4$cmov r8, code%1$c%4$cmov r9, 9%1$c%4$cxor rax, rax%1$c%4$ccall dprintf wrt ..plt%1$c%4$cpop rbp%1$c%%endmacro%1$c%1$c%%macro EXIT 0%1$c%4$cmov rax, 60%1$c%4$cmov rdi, 0%1$c%4$csyscall%1$c%%endmacro%1$c%1$csection .text%1$c%4$cglobal main%1$c%4$cextern dprintf%1$c%1$c;Grace - self-replicating program using macros only.%1$c%1$cmain:%1$c%4$cOPEN%1$c%4$cWRITE%1$c%4$cEXIT%1$c%1$csection .data%1$c%4$cfile db %2$cGrace_kid.s%2$c, 0%1$c%4$ccode db %2$c%3$s%2$c, 0%1$c", 0
