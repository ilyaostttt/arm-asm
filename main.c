#include <stdio.h>
#include "data.h"
#include "block_copy.h"

#define ARR_SIZE 6

extern int ex4_2(void);

int main(int argc, char *argv[])
{
	int source_arr[ARR_SIZE] = {1, 2, 3, 4, 5, 6};
	int dest_arr[ARR_SIZE] = {0};
	int i;

	printf("%d %d %d\n", my_byte, my_byte_aligned, my_long);

	printf("source: ");
	for (i = 0; i < ARR_SIZE; ++i)
		printf("%d ", source_arr[i]);
	printf("\n");

	printf("dest before: ");
	for (i = 0; i < ARR_SIZE; ++i)
		printf("%d ", dest_arr[i]);
	printf("\n");

	block_copy((char *)dest_arr, (char *)source_arr, ARR_SIZE * sizeof(source_arr[0]));

	printf("dest after: ");
	for (i = 0; i < ARR_SIZE; ++i)
		printf("%d ", dest_arr[i]);
	printf("\n");

	ex4_2();

	return 0;
}
