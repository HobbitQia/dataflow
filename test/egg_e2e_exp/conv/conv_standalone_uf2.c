/* 1D convolution standalone: integer, N=1024, K=7, pointer args
 * pragma unroll_count(2) on inner accumulation loop */
#define N    1024
#define K    7
#define KRAD (K / 2)

void kernel(int *out, int *in, int *weight);

int main(void)
{
  static int in_buf[N], out_buf[N], weight[K];
  int i;
  for (i = 0; i < N; i++) in_buf[i] = i % 31;
  for (i = 0; i < K; i++) weight[i] = i + 1;
  kernel(out_buf, in_buf, weight);
  return 0;
}

void kernel(int *out, int *in, int *weight)
{
  int i, k;
  for (i = KRAD; i < N - KRAD; i++) {
    int acc = 0;
#pragma clang loop unroll_count(2)
    for (k = 0; k < K; k++) {
      acc += in[i - KRAD + k] * weight[k];
    }
    out[i] = acc;
  }
}
