section .text
	global main
	extern sprintf
	extern fopen
	extern fclose
	extern fprintf

main:
	push rbp
	mov rbp, rsp

	;int i = 5;
	mov edi, 5
	;int x = i - 1
	mov esi, edi
	sub esi, 1
	mov edx, esi

	;sprintf(buffer, "Sully/Sully_%d.s", x);
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

	mov rbx, rax	;guardar FILE*

	;fprintf(f, code, ...);
	mov rdi, rbx	;FILE*
	mov rsi, code	;code
	mov rdx, 10		;%1$c = '\n'
	mov rcx, 9		;%2$c = '\t'
	mov r8, 34		;%3$c = "
	mov r9, code	;%4$c = string

	xor rax, rax
	call fprintf

	;fclose
	mov rdi, rbx
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

code db "section .text%1$c%2$cglobal main%1$c%2$cextern sprintf%1$c%2$cextern fopen%1$c%2$cextern fclose%1$c%2$cextern fprintf%1$c%1$cmain:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$c;int i = 5;%1$c%2$cmov edi, 5%1$c%2$c;int x = i - 1%1$c%2$cmov esi, edi%1$c%2$csub esi, 1%1$c%2$cmov edx, esi%1$c%1$c%2$c;sprintf(buffer, %3$cSully/Sully_%%d.s%3$c, x);%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, form%1$c%2$cxor rax, rax%1$c%2$ccall sprintf%1$c%1$c%2$c;fopen(buffer, %3$cw%3$c);%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, mode%1$c%2$ccall fopen%1$c%1$c%2$ctest rax, rax%1$c%2$cjz .error%1$c%1$c%2$cmov rbx, rax%2$c;guardar FILE*%1$c%1$c%2$c;fprintf(f, code, ...);%1$c%2$cmov rdi, rbx%2$c;FILE*%1$c%2$cmov rsi, code%2$c;code%1$c%2$cmov rdx, 10%2$c%2$c;%%1$c = '\n'%1$c%2$cmov rcx, 9%2$c%2$c;%%2$c = '\t'%1$c%2$cmov r8, 34%2$c%2$c;%%3$c = %3$c%1$c%2$cmov r9, code%2$c;%%4$c = string%1$c%1$c%2$cxor rax, rax%1$c%2$ccall fprintf%1$c%1$c%2$c;fclose%1$c%2$cmov rdi, rbx%1$c%2$ccall fclose%1$c%1$c%2$cxor eax, eax%1$c%2$cleave%1$c%2$cret%1$c%1$c.error:%1$c%2$cxor eax, 1%1$c%2$cleave%1$c%2$cret%1$c%1$csection .bss%1$c%2$cbuffer resb 64%1$c%1$csection .data%1$c%2$cform db %3$cSully/Sully_%%d.s%3$c, 0%1$c%2$cmode db %3$cw%3$c, 0%1$c%1$ccode db %3$c%4$s%3$c, 0%1$c", 0
