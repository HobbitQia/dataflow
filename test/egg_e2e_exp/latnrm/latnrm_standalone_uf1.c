/* layer normalization standalone: integer approx, N=512, D=64
 * For each row: mean = sum/D, var = sum_sq/D - mean*mean
 * out[i] = (in[i] - mean) * gamma[j] (skip sqrt for integer)
 * pointer args, pragma unroll_count(1) on inner j-loop */
#define N 512
#define D 64

void kernel(int *out, int *in, int *gamma);

int main(void)
{
  static int in_buf[N * D], out_buf[N * D], gamma_buf[D];
  int i;
  for (i = 0; i < N * D; i++) in_buf[i] = i % 23 - 11;
  for (i = 0; i < D; i++) gamma_buf[i] = i + 1;
  kernel(out_buf, in_buf, gamma_buf);
  return 0;
}

void kernel(int *out, int *in, int *gamma)
{
  int i, j;
  for (i = 0; i < N; i++) {
    int sum = 0;
#pragma clang loop unroll_count(1)
    for (j = 0; j < D; j++) {
      sum += in[i * D + j];
    }
    int mean = sum / D;
#pragma clang loop unroll_count(1)
    for (j = 0; j < D; j++) {
      out[i * D + j] = (in[i * D + j] - mean) * gamma[j];
    }
  }
}
