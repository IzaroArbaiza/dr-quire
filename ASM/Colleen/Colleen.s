section .text
	global main
	extern printf

;Colleen - a simple quine that prints itself.

main:
	;This function prints the program source code
	call print_self

	xor rax, rax
	ret

print_self:
	lea rdi, [rel code]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [rel code]
	mov r8, 9
	xor rax, rax
	call printf wrt ..plt
	ret

section .data
	code db "section .text%1$c%4$cglobal main%1$c%4$cextern printf%1$c%1$c;Colleen - a simple quine that prints itself.%1$c%1$cmain:%1$c%4$c;This function prints the program source code%1$c%4$ccall print_self%1$c%1$c%4$cxor rax, rax%1$c%4$cret%1$c%1$cprint_self:%1$c%4$clea rdi, [rel code]%1$c%4$cmov rsi, 10%1$c%4$cmov rdx, 34%1$c%4$clea rcx, [rel code]%1$c%4$cmov r8, 9%1$c%4$cxor rax, rax%1$c%4$ccall printf wrt ..plt%1$c%4$cret%1$c%1$csection .data%1$c%4$ccode db %2$c%3$s%2$c, 0%1$c", 0
