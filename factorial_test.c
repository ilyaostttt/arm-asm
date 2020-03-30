#include <stdio.h>

extern unsigned factorial(unsigned n);

int main()
{
	unsigned i = 0;
	unsigned f;

	for (i = 0; i < 14; ++i)
		f = factorial(i);

	printf("%u\n", f);

	return 0;
}