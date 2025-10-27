#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
	int i = 5;
	int x = i - 1;
	char *code = "#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>%c%cint main() {%c%cint i = %d;%c%cint x = i - 1;%c%cchar *code = %c%s%c;%c%c%cif (i < 0)%c%c%creturn 0;%c%cchar filename[32];%c%csprintf(filename, %cSully/Sully_%%d.c%c, x);%c%cFILE *f = fopen(filename, %cw%c);%c%cif (!f)%c%c%creturn 1;%c%cfprintf(f, code, 10,10,10,10,10,9,x,10,9,10,9,34,code,34,10,10,9,10,9,9,10,9,10,9,34,34,10,9,34,34,10,9,10,9,9,10,9,10,9,10,10,9,10,9,34,34,10,9,10,9,10,9,34,34,10,9,10,10,9,10);%c%cfclose(f);%c%c%cchar compile_cmd[128];%c%csprintf(compile_cmd, %cgcc -Wall -Wextra -Werror %%s -o Sully/Sully_%%d%c, filename, x);%c%csystem(compile_cmd);%c%cchar exec_cmd[64];%c%csprintf(exec_cmd, %c./Sully/Sully_%%d%c, x);%c%csystem(exec_cmd);%c%c%creturn 0;%c}";

	if (i < 0)
		return 0;
	char filename[32];
	sprintf(filename, "Sully/Sully_%d.c", x);
	FILE *f = fopen(filename, "w");
	if (!f)
		return 1;
	fprintf(f, code, 10,10,10,10,10,9,x,10,9,10,9,34,code,34,10,10,9,10,9,9,10,9,10,9,34,34,10,9,34,34,10,9,10,9,9,10,9,10,9,10,10,9,10,9,34,34,10,9,10,9,10,9,34,34,10,9,10,10,9,10);
	fclose(f);

	char compile_cmd[128];
	sprintf(compile_cmd, "gcc -Wall -Wextra -Werror %s -o Sully/Sully_%d", filename, x);
	system(compile_cmd);
	char exec_cmd[64];
	sprintf(exec_cmd, "./Sully/Sully_%d", x);
	system(exec_cmd);

	return 0;
}