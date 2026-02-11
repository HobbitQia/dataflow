#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include "polybench.h"
#include "bicg.h"

static void init_array(int m, int n,
    DATA_TYPE POLYBENCH_2D(A,N,M,n,m),
    DATA_TYPE POLYBENCH_1D(r,N,n),
    DATA_TYPE POLYBENCH_1D(p,M,m)) {
  int i, j;
  for (i = 0; i < m; i++) p[i] = (DATA_TYPE)(i % m) / m;
  for (i = 0; i < n; i++) {
    r[i] = (DATA_TYPE)(i % n) / n;
    for (j = 0; j < m; j++) A[i][j] = (DATA_TYPE)(i*(j+1) % n) / n;
  }
}

void kernel(int m, int n,
    DATA_TYPE POLYBENCH_2D(A,N,M,n,m),
    DATA_TYPE POLYBENCH_1D(s,M,m),
    DATA_TYPE POLYBENCH_1D(q,N,n),
    DATA_TYPE POLYBENCH_1D(p,M,m),
    DATA_TYPE POLYBENCH_1D(r,N,n)) {
  int i, j;
  for (i = 0; i < _PB_M; i++) s[i] = 0;
  for (i = 0; i < _PB_N; i++) {
    q[i] = SCALAR_VAL(0.0);
    for (j = 0; j < _PB_M; j += 4) {
      s[j]   = s[j]   + r[i] * A[i][j];
      q[i]   = q[i]   + A[i][j]   * p[j];
      s[j+1] = s[j+1] + r[i] * A[i][j+1];
      q[i]   = q[i]   + A[i][j+1] * p[j+1];
      s[j+2] = s[j+2] + r[i] * A[i][j+2];
      q[i]   = q[i]   + A[i][j+2] * p[j+2];
      s[j+3] = s[j+3] + r[i] * A[i][j+3];
      q[i]   = q[i]   + A[i][j+3] * p[j+3];
    }
  }
}

int main(int argc, char** argv) {
  int n = N; int m = M;
  POLYBENCH_2D_ARRAY_DECL(A, DATA_TYPE, N, M, n, m);
  POLYBENCH_1D_ARRAY_DECL(s, DATA_TYPE, M, m);
  POLYBENCH_1D_ARRAY_DECL(q, DATA_TYPE, N, n);
  POLYBENCH_1D_ARRAY_DECL(p, DATA_TYPE, M, m);
  POLYBENCH_1D_ARRAY_DECL(r, DATA_TYPE, N, n);
  init_array(m, n, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(r), POLYBENCH_ARRAY(p));
  kernel(m, n, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(s), POLYBENCH_ARRAY(q), POLYBENCH_ARRAY(p), POLYBENCH_ARRAY(r));
  return 0;
}
