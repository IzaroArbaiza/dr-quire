#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int i = 5;
    int x = i - 1;
    char *code = "#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>"
        "%cint main(){%c%cint i=%d;%cint x=i-1;%cchar *code=%c%s%c;"
        "%cif(i<0)%creturn 0;%cchar filename[32];%csprintf(filename,%cSully_%%d.c%c,x);%cFILE *f=fopen(filename,%cw%c);"
        "%cif(!f)return 1;%cfprintf(f, code, 10,10,10,10, 9,x,10,10,34,code,34,10,10,10,10,34,34,10,34,34,10,10,10,10,10,34,34,10,10,10,34,34,10,10,10);%cfclose(f);"
        "%cchar compile_cmd[128];%csprintf(compile_cmd,%cgcc -Wall -Wextra -Werror %%s -o Sully_%%d%c,filename,x);%csystem(compile_cmd);"
        "%cchar exec_cmd[64];%csprintf(exec_cmd,%c./Sully_%%d%c,x);%csystem(exec_cmd);"
        "%creturn 0;%c}";
    
    if (i < 0)
        return 0;
    char filename[32];
    sprintf(filename, "Sully_%d.c", x);
    FILE *f = fopen(filename, "w");
    if (!f)
        return 1;
    fprintf(f, code, 10,10,
        10,10,9,x,10,10,34,code,34,
        10,10,10,10,34,34,10,34,34,
        10,10,10,
        10,10,34,34,10,
        10,10,34,34,10,
        10, 10);
    fclose(f);

    char compile_cmd[128];
    sprintf(compile_cmd, "gcc -Wall -Wextra -Werror %s -o Sully_%d", filename, x);
    system(compile_cmd);
    char exec_cmd[64];
    sprintf(exec_cmd, "./Sully_%d", x);
    system(exec_cmd);
    
    return 0;
}
