section .text
	global main
	extern sprintf
	extern fopen
	extern fclose
	extern fprintf
	extern system

main:
	push rbp
	mov rbp, rsp

	;int i = 5;
	mov edi, 5
	;int x = i - 1
	mov esi, edi
	sub esi, 1
	mov [x_store], esi

	;if(i < 0)
	cmp esi, -1
	jl .exit

	;sprintf(buffer, "Sully_%d.s", x);
	mov rdi, buffer
	mov rsi, form
	mov edx, [x_store]
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

	sub rsp, 16
	mov eax, [x_store]
	mov [rsp], rax

	xor rax, rax
	call fprintf
	add rsp, 16

	;fclose
	mov rdi, rbx
	call fclose

	;COMPILAR
	;sprintf(compile_cmd, compile, buffer, x)
	mov rdi, compile_cmd
	mov rsi, compile
	mov rdx, buffer		; %1$s
	mov ecx, [x_store]	; %2$d
	xor rax, rax
	call sprintf

	;system(compile_cmd)
	mov rdi, compile_cmd
	call system

	;EJECUTAR
	mov rdi, exec_cmd
	mov rsi, exec
	mov edx, [x_store]
	xor rax, rax
	call sprintf

	mov rdi, exec_cmd
	call system

.exit:
	xor eax, eax
	leave
	ret

.error:
	xor eax, 1
	leave
	ret

section .bss
	buffer resb 64
	compile_cmd resb 256
	exec_cmd resb 64
	x_store resd 1

section .data
	form db "Sully_%d.s", 0
	mode db "w", 0
	compile db "nasm -f elf64 %1$s -o Sully_%2$d.o && gcc -no-pie Sully_%2$d.o -o Sully_%2$d && rm -f Sully_%2$d.o", 0
	exec db "./Sully_%d", 0

code db "section .text%1$c%2$cglobal main%1$c%2$cextern sprintf%1$c%2$cextern fopen%1$c%2$cextern fclose%1$c%2$cextern fprintf%1$c%2$cextern system%1$c%1$cmain:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$cmov edi, %5$d%1$c%2$cmov esi, edi%1$c%2$csub esi, 1%1$c%2$cmov [x_store], esi%1$c%2$ccmp esi, -1%1$c%2$cjl .exit%1$c%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, form%1$c%2$cmov edx, [x_store]%1$c%2$cxor rax, rax%1$c%2$ccall sprintf%1$c%1$c%2$cmov rdi, buffer%1$c%2$cmov rsi, mode%1$c%2$ccall fopen%1$c%2$ctest rax, rax%1$c%2$cjz .error%1$c%2$cmov rbx, rax%1$c%1$c%2$cmov rdi, rbx%1$c%2$cmov rsi, code%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, code%1$c%2$csub rsp, 16%1$c%2$cmov eax, [x_store]%1$c%2$cmov [rsp], rax%1$c%2$cxor rax, rax%1$c%2$ccall fprintf%1$c%2$cadd rsp, 16%1$c%1$c%2$cmov rdi, rbx%1$c%2$ccall fclose%1$c%1$c%2$cmov rdi, compile_cmd%1$c%2$cmov rsi, compile%1$c%2$cmov rdx, buffer%1$c%2$cmov ecx, [x_store]%1$c%2$cxor rax, rax%1$c%2$ccall sprintf%1$c%2$cmov rdi, compile_cmd%1$c%2$ccall system%1$c%1$c%2$cmov rdi, exec_cmd%1$c%2$cmov rsi, exec%1$c%2$cmov edx, [x_store]%1$c%2$cxor rax, rax%1$c%2$ccall sprintf%1$c%2$cmov rdi, exec_cmd%1$c%2$ccall system%1$c%1$c.exit:%1$c%2$cxor eax, eax%1$c%2$cleave%1$c%2$cret%1$c%1$c.error:%1$c%2$cmov eax, 1%1$c%2$cleave%1$c%2$cret%1$c%1$csection .bss%1$c%2$cbuffer resb 64%1$c%2$ccompile_cmd resb 256%1$c%2$cexec_cmd resb 64%1$c%2$cx_store resd 1%1$c%1$csection .data%1$c%2$cform db %3$cSully_%%d.s%3$c, 0%1$c%2$cmode db %3$cw%3$c, 0%1$c%2$ccompile db %3$cnasm -f elf64 %%1$s -o Sully_%%2$d.o && gcc -no-pie Sully_%%2$d.o -o Sully_%%2$d && rm -f Sully_%%2$d.o%3$c, 0%1$c%2$cexec db %3$c./Sully_%%d%3$c, 0%1$ccode db %3$c%4$s%3$c, 0%1$c", 0