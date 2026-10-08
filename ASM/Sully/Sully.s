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

	mov edi, 5
	mov [rel x_store], edi

	cmp dword [rel x_store], 0
	jl .exit

	mov eax, [rel x_store]
	sub eax, 1
	mov [rel x_next], eax

	lea rdi, [rel buffer]
	lea rsi, [rel form]
	mov edx, [rel x_store]
	xor rax, rax
	call sprintf wrt ..plt

	lea rdi, [rel buffer]
	lea rsi, [rel mode]
	call fopen wrt ..plt

	test rax, rax
	jz .error

	mov rbx, rax

	mov rdi, rbx
	lea rsi, [rel code]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	lea r9, [rel code]

	sub rsp, 16
	mov eax, [rel x_next]
	mov [rel rsp], rax

	xor rax, rax
	call fprintf wrt ..plt
	add rsp, 16

	mov rdi, rbx
	call fclose wrt ..plt

	lea rdi, [rel compile_cmd]
	lea rsi, [rel compile]
	lea rdx, [rel buffer]
	mov ecx, [rel x_store]
	xor rax, rax
	call sprintf wrt ..plt

	lea rdi, [rel compile_cmd]
	call system wrt ..plt

	lea rdi, [rel exec_cmd]
	lea rsi, [rel exec]
	mov edx, [rel x_store]
	xor rax, rax
	call sprintf wrt ..plt

	lea rdi, [rel exec_cmd]
	call system wrt ..plt

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
	x_next resd 1

section .data
	form db "Sully_%d.s", 0
	mode db "w", 0
	compile db "nasm -f elf64 %1$s -o Sully_%2$d.o && gcc -no-pie Sully_%2$d.o -o Sully_%2$d && rm -f Sully_%2$d.o", 0
	exec db "./Sully_%d", 0

code db "section .text%1$c%2$cglobal main%1$c%2$cextern sprintf%1$c%2$cextern fopen%1$c%2$cextern fclose%1$c%2$cextern fprintf%1$c%2$cextern system%1$c%1$cmain:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$cmov edi, %5$d%1$c%2$cmov [rel x_store], edi%1$c%1$c%2$ccmp dword [rel x_store], 0%1$c%2$cjl .exit%1$c%1$c%2$cmov eax, [rel x_store]%1$c%2$csub eax, 1%1$c%2$cmov [rel x_next], eax%1$c%1$c%2$clea rdi, [rel buffer]%1$c%2$clea rsi, [rel form]%1$c%2$cmov edx, [rel x_store]%1$c%2$cxor rax, rax%1$c%2$ccall sprintf wrt ..plt%1$c%1$c%2$clea rdi, [rel buffer]%1$c%2$clea rsi, [rel mode]%1$c%2$ccall fopen wrt ..plt%1$c%1$c%2$ctest rax, rax%1$c%2$cjz .error%1$c%1$c%2$cmov rbx, rax%1$c%1$c%2$cmov rdi, rbx%1$c%2$clea rsi, [rel code]%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$clea r9, [rel code]%1$c%1$c%2$csub rsp, 16%1$c%2$cmov eax, [rel x_next]%1$c%2$cmov [rel rsp], rax%1$c%1$c%2$cxor rax, rax%1$c%2$ccall fprintf wrt ..plt%1$c%2$cadd rsp, 16%1$c%1$c%2$cmov rdi, rbx%1$c%2$ccall fclose wrt ..plt%1$c%1$c%2$clea rdi, [rel compile_cmd]%1$c%2$clea rsi, [rel compile]%1$c%2$clea rdx, [rel buffer]%1$c%2$cmov ecx, [rel x_store]%1$c%2$cxor rax, rax%1$c%2$ccall sprintf wrt ..plt%1$c%1$c%2$clea rdi, [rel compile_cmd]%1$c%2$ccall system wrt ..plt%1$c%1$c%2$clea rdi, [rel exec_cmd]%1$c%2$clea rsi, [rel exec]%1$c%2$cmov edx, [rel x_store]%1$c%2$cxor rax, rax%1$c%2$ccall sprintf wrt ..plt%1$c%1$c%2$clea rdi, [rel exec_cmd]%1$c%2$ccall system wrt ..plt%1$c%1$c.exit:%1$c%2$cxor eax, eax%1$c%2$cleave%1$c%2$cret%1$c%1$c.error:%1$c%2$cxor eax, 1%1$c%2$cleave%1$c%2$cret%1$c%1$csection .bss%1$c%2$cbuffer resb 64%1$c%2$ccompile_cmd resb 256%1$c%2$cexec_cmd resb 64%1$c%2$cx_store resd 1%1$c%2$cx_next resd 1%1$c%1$csection .data%1$c%2$cform db %3$cSully_%%d.s%3$c, 0%1$c%2$cmode db %3$cw%3$c, 0%1$c%2$ccompile db %3$cnasm -f elf64 %%1$s -o Sully_%%2$d.o && gcc -no-pie Sully_%%2$d.o -o Sully_%%2$d && rm -f Sully_%%2$d.o%3$c, 0%1$c%2$cexec db %3$c./Sully_%%d%3$c, 0%1$c%1$ccode db %3$c%4$s%3$c, 0%1$c", 0
