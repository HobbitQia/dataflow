/* gemv standalone: y = A*x, N=512, manually unrolled x4 on j-loop */
#define N 512

void kernel(const int *A, const int *x, int *y);

int main(void)
{
  static int A[N * N];
  static int x[N];
  static int y[N];
  int i, j;
  for (i = 0; i < N; i++) {
    x[i] = i % 11;
    for (j = 0; j < N; j++)
      A[i * N + j] = (i + j) % 13;
  }
  kernel(A, x, y);
  return 0;
}

void kernel(const int *A, const int *x, int *y)
{
  int i, j;
  for (i = 0; i < N; i++) {
    int acc = 0;
    for (j = 0; j < N; j += 4) {
      acc += A[i * N + j]     * x[j];
      acc += A[i * N + j + 1] * x[j + 1];
      acc += A[i * N + j + 2] * x[j + 2];
      acc += A[i * N + j + 3] * x[j + 3];
    }
    y[i] = acc;
  }
}
