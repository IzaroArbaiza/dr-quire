#include <stdio.h>
#define FILE_NAME "Grace/Grace_kid.c"
#define CODE "#include <stdio.h>%c#define FILE_NAME %cGrace/Grace_kid.c%c%c#define CODE %c%s%c%c#define FT() int main() {FILE *f = fopen(FILE_NAME, %cw%c);if (!f)return (1);fprintf(f, CODE, 10, 34, 34, 10, 34, CODE, 34, 10, 34, 34, 10, 10, 9, 10, 10);fclose(f);return (0);}%c/*%c%cGrace - self-replicating program using macros only.%c*/%cFT()"
#define FT() int main() {FILE *f = fopen(FILE_NAME, "w");if (!f)return (1);fprintf(f, CODE, 10, 34, 34, 10, 34, CODE, 34, 10, 34, 34, 10, 10, 9, 10, 10);fclose(f);return (0);}
/*
	Grace - self-replicating program using macros only.
*/
FT()