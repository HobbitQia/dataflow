#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include "polybench.h"
#include "gemm.h"

static void init_array(int ni, int nj, int nk,
    DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
    DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk),
    DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj)) {
  int i, j;
  for (i = 0; i < ni; i++) for (j = 0; j < nj; j++) C[i][j] = (DATA_TYPE)(i*j % ni) / ni;
  for (i = 0; i < ni; i++) for (j = 0; j < nk; j++) A[i][j] = (DATA_TYPE)(i*(j+1) % nk) / nk;
  for (i = 0; i < nk; i++) for (j = 0; j < nj; j++) B[i][j] = (DATA_TYPE)(i*(j+2) % nj) / nj;
}

void kernel(int ni, int nj, int nk,
    DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj),
    DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk),
    DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj)) {
  int i, j, k;
  for (i = 0; i < _PB_NI; i++) {
    for (k = 0; k < _PB_NK; k++) {
      for (j = 0; j < _PB_NJ; j += 4) {
        C[i][j]   += A[i][k] * B[k][j];
        C[i][j+1] += A[i][k] * B[k][j+1];
        C[i][j+2] += A[i][k] * B[k][j+2];
        C[i][j+3] += A[i][k] * B[k][j+3];
      }
    }
  }
}

int main(int argc, char** argv) {
  int ni = NI, nj = NJ, nk = NK;
  POLYBENCH_2D_ARRAY_DECL(C, DATA_TYPE, NI, NJ, ni, nj);
  POLYBENCH_2D_ARRAY_DECL(A, DATA_TYPE, NI, NK, ni, nk);
  POLYBENCH_2D_ARRAY_DECL(B, DATA_TYPE, NK, NJ, nk, nj);
  init_array(ni, nj, nk, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
  kernel(ni, nj, nk, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
  return 0;
}
