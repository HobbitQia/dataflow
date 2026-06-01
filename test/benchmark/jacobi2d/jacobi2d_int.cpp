#ifndef N
#define N 8
#endif

#ifndef TSTEPS
#define TSTEPS 1
#endif

extern "C" void kernel_jacobi2d_int(int *A, int *B) {
  int t, i, j;

#pragma clang loop unroll(disable) vectorize(disable)
  for (t = 0; t < TSTEPS; t++) {
#pragma clang loop unroll(disable) vectorize(disable)
    for (i = 1; i < N - 1; i++) {
#pragma clang loop unroll(disable) vectorize(disable)
      for (j = 1; j < N - 1; j++) {
        int idx = i * N + j;
        B[idx] =
            (A[idx] + A[idx - 1] + A[idx + 1] + A[idx - N] + A[idx + N]) / 5;
      }
    }

#pragma clang loop unroll(disable) vectorize(disable)
    for (i = 1; i < N - 1; i++) {
#pragma clang loop unroll(disable) vectorize(disable)
      for (j = 1; j < N - 1; j++) {
        int idx = i * N + j;
        A[idx] =
            (B[idx] + B[idx - 1] + B[idx + 1] + B[idx - N] + B[idx + N]) / 5;
      }
    }
  }
}

int main() {
  static int A[N * N];
  static int B[N * N];
  kernel_jacobi2d_int(A, B);
  return 0;
}
