/* relu.c: pragma unroll_count(1) */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include "polybench.h"
#include "relu.h"

static
void init_array(int ni, int nj, int nk,
                DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
                DATA_TYPE POLYBENCH_2D(A,NI,NJ,ni,nj),
                DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj))
{
  int i, j;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = (DATA_TYPE) (i*j % ni) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      A[i][j] = (DATA_TYPE) (i*(j+1) % nk) / nk;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (DATA_TYPE) (i*(j+2) % nj) / nj;
}

static
void print_array(int ni, int nj,
                 DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj))
{
  int i, j;
  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("C");
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
        if ((i * ni + j) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
        fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, C[i][j]);
    }
  POLYBENCH_DUMP_END("C");
  POLYBENCH_DUMP_FINISH;
}

void kernel(int ni, int nj, int nk,
           DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
           DATA_TYPE POLYBENCH_2D(A,NI,NJ,ni,nj),
           DATA_TYPE POLYBENCH_2D(B,NI,NJ,ni,nj))
{
  int x = 0, i = 0, j = 0;
  int total = NI * NJ;
#pragma clang loop vectorize(disable) unroll_count(1)
  for (x = 0; x < total; x++) {
    i = x / NJ;
    j = x % NJ;
    if (A[i][j] < 0)
      C[i][j] = 0;
    else
      C[i][j] = A[i][j];
  }
}

int main(int argc, char** argv)
{
  int ni = NI;
  int nj = NJ;
  int nk = NK;
  POLYBENCH_2D_ARRAY_DECL(C,DATA_TYPE,NI,NJ,ni,nj);
  POLYBENCH_2D_ARRAY_DECL(A,DATA_TYPE,NI,NJ,ni,nj);
  POLYBENCH_2D_ARRAY_DECL(B,DATA_TYPE,NI,NJ,ni,nj);
  init_array(ni, nj, nk, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
  polybench_start_instruments;
  kernel(ni, nj, nk, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
  polybench_stop_instruments;
  polybench_print_instruments;
  polybench_prevent_dce(print_array(ni, nj, POLYBENCH_ARRAY(C)));
  POLYBENCH_FREE_ARRAY(C);
  POLYBENCH_FREE_ARRAY(A);
  POLYBENCH_FREE_ARRAY(B);
  return 0;
}
