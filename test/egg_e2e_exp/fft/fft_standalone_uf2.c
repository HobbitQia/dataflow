/* fft standalone: single butterfly stage with fixed BPGROUP=128
 * Unrolls the inner k-loop with compile-time bound BPGROUP
 * pragma unroll_count(2) */
#define BPGROUP 128   /* buttersPerGroup for stage 0: NPOINTS/2 = 128 */

void kernel(int *data_real, int *data_imag,
            int Wr, int Wi, long offset);

int main(void)
{
  static int data_real[256];
  static int data_imag[256];
  int i;
  for (i = 0; i < 256; i++) { data_real[i] = i; data_imag[i] = 1; }
  kernel(data_real, data_imag, 2, 2, 0L);
  return 0;
}

void kernel(int *data_real, int *data_imag,
            int Wr, int Wi, long offset)
{
  int k;
  int temp_real, temp_imag;
#pragma clang loop unroll_count(2)
  for (k = 0; k < BPGROUP; ++k) {
    temp_real = Wr * data_real[offset + BPGROUP + k] -
                Wi * data_imag[offset + BPGROUP + k];
    temp_imag = Wi * data_real[offset + BPGROUP + k] +
                Wr * data_imag[offset + BPGROUP + k];
    data_real[offset + BPGROUP + k] = data_real[offset + k] - temp_real;
    data_real[offset + k]          += temp_real;
    data_imag[offset + BPGROUP + k] = data_imag[offset + k] - temp_imag;
    data_imag[offset + k]          += temp_imag;
  }
}
