#ifndef N
#define N 8
#endif

extern "C" void kernel_jacobi2d_step_int(int *A, int *B) {
  int k, idx, col;

  idx = N + 1;
  col = 0;

#pragma clang loop unroll(disable) vectorize(disable)
  for (k = 0; k < (N - 2) * (N - 2); k++) {
    B[idx] =
        (A[idx] + A[idx - 1] + A[idx + 1] + A[idx - N] + A[idx + N]) / 5;
    idx++;
    col++;
    if (col == N - 2) {
      col = 0;
      idx += 2;
    }
  }
}

int main() {
  static int A[N * N];
  static int B[N * N];
  kernel_jacobi2d_step_int(A, B);
  return 0;
}
