/* bicg standalone: integer, M=N=256, manually unrolled x2 */
#define M 256
#define N 256

int A[N][M];
int r[N];
int p[M];
int s[M];
int q[N];

void kernel(int A[][M], int s[], int q[], int p[], int r[]);

int main(void)
{
  int i, j;
  for (i = 0; i < N; i++) {
    r[i] = i % N;
    for (j = 0; j < M; j++)
      A[i][j] = (i * (j + 1)) % N;
  }
  for (i = 0; i < M; i++)
    p[i] = i % M;
  kernel(A, s, q, p, r);
  return 0;
}

void kernel(int A[][M], int s[], int q[], int p[], int r[])
{
  int i, j;
  for (i = 0; i < M; i++)
    s[i] = 0;
  for (i = 0; i < N; i++) {
    q[i] = 0;
    for (j = 0; j < M; j += 2) {
      s[j]     = s[j]     + r[i] * A[i][j];
      q[i]     = q[i]     + A[i][j] * p[j];
      s[j + 1] = s[j + 1] + r[i] * A[i][j + 1];
      q[i]     = q[i]     + A[i][j + 1] * p[j + 1];
    }
  }
}
