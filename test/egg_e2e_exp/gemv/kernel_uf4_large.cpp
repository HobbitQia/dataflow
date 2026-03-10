extern "C" void kernel_gemv_int(const int *A, const int *x, int *y) {
  const int N = 512;
  for (int i = 0; i < N; ++i) {
    int acc = 0;
    for (int j = 0; j < N; j += 4) {
      acc += A[i * N + j]     * x[j];
      acc += A[i * N + j + 1] * x[j + 1];
      acc += A[i * N + j + 2] * x[j + 2];
      acc += A[i * N + j + 3] * x[j + 3];
    }
    y[i] = acc;
  }
}

int main() {
  static int A[512*512], x[512], y[512];
  kernel_gemv_int(A, x, y);
  return 0;
}
