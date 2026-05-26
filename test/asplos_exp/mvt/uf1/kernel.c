/* mvt standalone: x1[i]+=A[i*N+j]*y1[j], x2[i]+=A[j*N+i]*y2[j], N=64, manually unrolled x1 */
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
    for (i = 0; i < N; i++) {
      x1[i] = x1[i] + A[i * N + j] * y1[j];
      x2[i] = x2[i] + A[j * N + i] * y2[j];
    }
  }
}
