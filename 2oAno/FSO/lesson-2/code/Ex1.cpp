#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "delays.h"
#include "process.h"

int main(void)
{
  pid_t ret = pfork();
  int st = 0, fn = 20;

  if (ret == 0)
  {
    fn = fn / 2;
    for (int i = st; i < fn; i++)
    {
      printf("Child: %d\n", i+1);
    }
  }
  else
  {
    st = fn/2;
    for (int i = st; i < fn; i++) {
      printf("Parent: %d\n", i+1);
    }
  }

  return EXIT_SUCCESS;
}
