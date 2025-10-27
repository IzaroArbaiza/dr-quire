#include <stdio.h>

/*
	Colleen - a simple quine that prints itself.
*/

void print_source() {
	char *src = "#include <stdio.h>%c%c/*%c%cColleen - a simple quine that prints itself.%c*/%c%cvoid print_source() {%c%cchar *src = %c%s%c;%c%cprintf(src, 10, 10, 10, 9, 10, 10, 10, 10, 9, 34, src, 34, 10, 9, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 10);%c}%c%cint main() {%c%c//Main that calls print_source.%c%cprint_source();%c%creturn (0);%c}%c";
	printf(src, 10, 10, 10, 9, 10, 10, 10, 10, 9, 34, src, 34, 10, 9, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 10);
}

int main() {
	//Main that calls print_source.
	print_source();
	return (0);
}
