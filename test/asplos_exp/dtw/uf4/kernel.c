/* dtw standalone: dynamic time warping, N=512, manually unrolled x4 */
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
    for (x = 1; x < N; x += 4) {
      int s_val = S[i];

      int t0 = T[x];
      int d10 = s_val - t0;
      int d20 = t0 - s_val;
      int cost0 = d10;
      if (d20 > d10) { cost0 = d20; }
      int a0 = DTW[(i - 1) * STRIDE + x];
      int b0 = DTW[i * STRIDE + x];
      int c0 = DTW[i * STRIDE + (x - 1)];
      int min0 = a0;
      if (b0 < min0) { min0 = b0; }
      if (c0 < min0) { min0 = c0; }
      DTW[(i + 1) * STRIDE + (x + 1)] = cost0 + min0;

      int t1 = T[x + 1];
      int d11 = s_val - t1;
      int d21 = t1 - s_val;
      int cost1 = d11;
      if (d21 > d11) { cost1 = d21; }
      int a1 = DTW[(i - 1) * STRIDE + (x + 1)];
      int b1 = DTW[i * STRIDE + (x + 1)];
      int c1 = DTW[i * STRIDE + x];
      int min1 = a1;
      if (b1 < min1) { min1 = b1; }
      if (c1 < min1) { min1 = c1; }
      DTW[(i + 1) * STRIDE + (x + 2)] = cost1 + min1;

      int t2 = T[x + 2];
      int d12 = s_val - t2;
      int d22 = t2 - s_val;
      int cost2 = d12;
      if (d22 > d12) { cost2 = d22; }
      int a2 = DTW[(i - 1) * STRIDE + (x + 2)];
      int b2 = DTW[i * STRIDE + (x + 2)];
      int c2 = DTW[i * STRIDE + (x + 1)];
      int min2 = a2;
      if (b2 < min2) { min2 = b2; }
      if (c2 < min2) { min2 = c2; }
      DTW[(i + 1) * STRIDE + (x + 3)] = cost2 + min2;

      int t3 = T[x + 3];
      int d13 = s_val - t3;
      int d23 = t3 - s_val;
      int cost3 = d13;
      if (d23 > d13) { cost3 = d23; }
      int a3 = DTW[(i - 1) * STRIDE + (x + 3)];
      int b3 = DTW[i * STRIDE + (x + 3)];
      int c3 = DTW[i * STRIDE + (x + 2)];
      int min3 = a3;
      if (b3 < min3) { min3 = b3; }
      if (c3 < min3) { min3 = c3; }
      DTW[(i + 1) * STRIDE + (x + 4)] = cost3 + min3;
    }
  }
}
