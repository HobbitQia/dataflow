/* mvt standalone: x1[i]+=A[i*N+j]*y1[j], x2[i]+=A[j*N+i]*y2[j], N=64, manually unrolled x4 */
#define N 64

void kernel(int *x1, int *x2, const int *A, const int *y1, const int *y2);

int main(void)
{
  static int A[N * N], x1[N], x2[N], y1[N], y2[N];
  int i, j;
  for (i = 0; i < N; i++) { x1[i] = 0; x2[i] = 0; y1[i] = i + 3; y2[i] = i + 4; }
  for (i = 0; i < N * N; i++) { A[i] = (i / N) * (i % N) % N; }
  kernel(x1, x2, A, y1, y2);
  return 0;
}

void kernel(int *x1, int *x2, const int *A, const int *y1, const int *y2)
{
  int i, j;
  for (j = 0; j < N; j++) {
    for (i = 0; i < N; i += 4) {
      x1[i]     = x1[i]     + A[i * N + j]       * y1[j];
      x2[i]     = x2[i]     + A[j * N + i]       * y2[j];
      x1[i + 1] = x1[i + 1] + A[(i + 1) * N + j] * y1[j];
      x2[i + 1] = x2[i + 1] + A[j * N + (i + 1)] * y2[j];
      x1[i + 2] = x1[i + 2] + A[(i + 2) * N + j] * y1[j];
      x2[i + 2] = x2[i + 2] + A[j * N + (i + 2)] * y2[j];
      x1[i + 3] = x1[i + 3] + A[(i + 3) * N + j] * y1[j];
      x2[i + 3] = x2[i + 3] + A[j * N + (i + 3)] * y2[j];
    }
  }
}
