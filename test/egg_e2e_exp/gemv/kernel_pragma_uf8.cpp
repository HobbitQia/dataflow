extern "C" void kernel_gemv_int(const int *A, const int *x, int *y) {
  const int N = 512;
  for (int i = 0; i < N; ++i) {
    int acc = 0;
#pragma clang loop unroll_count(8)
    for (int j = 0; j < N; ++j) {
      acc += A[i * N + j] * x[j];
    }
    y[i] = acc;
  }
}

int main() {
  static int A[512*512];
  static int x[512];
  static int y[512];
  kernel_gemv_int(A, x, y);
  return 0;
}
