#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include "polybench.h"
#include "relu.h"

void kernel(int ni, int nj, int nk,
    DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
    DATA_TYPE POLYBENCH_2D(A,NI,NJ,ni,nj),
    DATA_TYPE POLYBENCH_2D(B,NI,NJ,ni,nj)) {
  int x, i, j;
  int total = NI * NJ;
  for (x = 0; x < total; x += 4) {
    i = x / NJ; j = x % NJ;
    if (A[i][j] < 0) C[i][j] = 0; else C[i][j] = A[i][j];
    i = (x+1) / NJ; j = (x+1) % NJ;
    if (A[i][j] < 0) C[i][j] = 0; else C[i][j] = A[i][j];
    i = (x+2) / NJ; j = (x+2) % NJ;
    if (A[i][j] < 0) C[i][j] = 0; else C[i][j] = A[i][j];
    i = (x+3) / NJ; j = (x+3) % NJ;
    if (A[i][j] < 0) C[i][j] = 0; else C[i][j] = A[i][j];
  }
}

int main(int argc, char** argv) {
  int ni = NI, nj = NJ, nk = NK;
  POLYBENCH_2D_ARRAY_DECL(C, DATA_TYPE, NI, NJ, ni, nj);
  POLYBENCH_2D_ARRAY_DECL(A, DATA_TYPE, NI, NJ, ni, nj);
  POLYBENCH_2D_ARRAY_DECL(B, DATA_TYPE, NI, NJ, ni, nj);
  kernel(ni, nj, nk, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
  return 0;
}
