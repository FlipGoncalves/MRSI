#include <stdio.h>

#define NELMS(A) (sizeof(A) / sizeof(A[0]))

char* myarray = "Hello";

int
main (int argc, char *argv[])
{
  printf ("#/elements= %d...\n", NELMS(myarray));
  return 0;
}
