/* mvt standalone: integer, N=256, inner i-loop as CGRA kernel
 * pragma unroll_count(2) */
#define N 256

void kernel(int *x1, int *x2, int *A, int *y1, int *y2, int j);

int main(void)
{
  static int A[N * N];
  static int x1[N], x2[N], y1[N], y2[N];
  int i, j;
  for (i = 0; i < N; i++) {
    x1[i] = 0; x2[i] = 0;
    y1[i] = (i + 3) % N;
    y2[i] = (i + 4) % N;
    for (j = 0; j < N; j++)
      A[i * N + j] = (i * j) % N;
  }
  for (j = 0; j < N; j++)
    kernel(x1, x2, A, y1, y2, j);
  return 0;
}

void kernel(int *x1, int *x2, int *A, int *y1, int *y2, int j)
{
  int i;
#pragma clang loop unroll_count(2)
  for (i = 0; i < N; i++) {
    x1[i] = x1[i] + A[i * N + j] * y1[j];
    x2[i] = x2[i] + A[j * N + i] * y2[j];
  }
}
