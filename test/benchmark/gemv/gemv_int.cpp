// A simple int GEMV: y = A*x.
// Default to the checked small size, but allow scaled e2e artifacts with -DN=...
#ifndef N
#define N 4
#endif

extern "C" void kernel_gemv_int(const int *A, const int *x, int *y) {
  for (int i = 0; i < N; ++i) {
    int acc = 0;
    for (int j = 0; j < N; ++j) {
      acc += A[i * N + j] * x[j];
    }
    y[i] = acc;
  }
}

int main() {
  static int A[N * N];
  static int x[N];
  static int y[N];
  kernel_gemv_int(A, x, y);
  return 0;
}

