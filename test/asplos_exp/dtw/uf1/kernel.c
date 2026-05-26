/* dtw standalone: dynamic time warping, N=512, manually unrolled x1 */
#define N 512
#define STRIDE (N + 1)

void kernel(const int *S, const int *T, int *DTW);

int main(void)
{
  static int S[N], T[N], DTW[STRIDE * STRIDE];
  int i;
  for (i = 0; i < N; i++) { S[i] = i + 1; T[i] = i + 3; }
  for (i = 0; i < STRIDE * STRIDE; i++) { DTW[i] = 65535; }
  DTW[0] = 0;
  kernel(S, T, DTW);
  return 0;
}

void kernel(const int *S, const int *T, int *DTW)
{
  int i, x;
  for (i = 1; i < N; i++) {
    for (x = 1; x < N; x++) {
      int s_val = S[i];
      int t_val = T[x];
      int d1 = s_val - t_val;
      int d2 = t_val - s_val;
      int cost = d1;
      if (d2 > d1) {
        cost = d2;
      }
      int a = DTW[(i - 1) * STRIDE + x];
      int b = DTW[i * STRIDE + x];
      int c = DTW[i * STRIDE + (x - 1)];
      int min_val = a;
      if (b < min_val) {
        min_val = b;
      }
      if (c < min_val) {
        min_val = c;
      }
      DTW[(i + 1) * STRIDE + (x + 1)] = cost + min_val;
    }
  }
}
