/* fft standalone: single butterfly stage, BPGROUP=128, manually unrolled x2 */
#define BPGROUP 128

void kernel(int *data_real, int *data_imag, int Wr, int Wi, long offset);

int main(void)
{
  static int data_real[256];
  static int data_imag[256];
  int i;
  for (i = 0; i < 256; i++) { data_real[i] = i; data_imag[i] = 1; }
  kernel(data_real, data_imag, 2, 2, 0L);
  return 0;
}

void kernel(int *data_real, int *data_imag, int Wr, int Wi, long offset)
{
  int k;
  int temp_real0, temp_imag0;
  int temp_real1, temp_imag1;
  for (k = 0; k < BPGROUP; k += 2) {
    temp_real0 = Wr * data_real[offset + BPGROUP + k] -
                 Wi * data_imag[offset + BPGROUP + k];
    temp_imag0 = Wi * data_real[offset + BPGROUP + k] +
                 Wr * data_imag[offset + BPGROUP + k];
    data_real[offset + BPGROUP + k] = data_real[offset + k] - temp_real0;
    data_real[offset + k]          += temp_real0;
    data_imag[offset + BPGROUP + k] = data_imag[offset + k] - temp_imag0;
    data_imag[offset + k]          += temp_imag0;

    temp_real1 = Wr * data_real[offset + BPGROUP + k + 1] -
                 Wi * data_imag[offset + BPGROUP + k + 1];
    temp_imag1 = Wi * data_real[offset + BPGROUP + k + 1] +
                 Wr * data_imag[offset + BPGROUP + k + 1];
    data_real[offset + BPGROUP + k + 1] = data_real[offset + k + 1] - temp_real1;
    data_real[offset + k + 1]          += temp_real1;
    data_imag[offset + BPGROUP + k + 1] = data_imag[offset + k + 1] - temp_imag1;
    data_imag[offset + k + 1]          += temp_imag1;
  }
}
