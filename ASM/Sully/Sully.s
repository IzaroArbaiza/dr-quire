section .text
	global main
	extern sprintf
	extern fopen
	extern fclose

main:
	push rbp
	mov rbp, rsp

	;int i = 5;
	mov edi, 5
	;int x = i - 1
	mov esi, edi
	sub esi, 1
	mov edx, esi

	;sprintf(buffer, "Sully/Sully_%d.c", x);
	mov rdi, buffer
	mov rsi, form
	xor rax, rax
	call sprintf

	;fopen(buffer, "w");
	mov rdi, buffer
	mov rsi, mode
	call fopen

	test rax, rax
	jz .error

	mov rdi, rax
	call fclose

	xor eax, eax
	leave
	ret

.error:
	xor eax, 1
	leave
	ret

section .bss
	buffer resb 64
section .data
	form db "Sully/Sully_%d.s", 0
	mode db "w", 0

;code db "section .text", 0