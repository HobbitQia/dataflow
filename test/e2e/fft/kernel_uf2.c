#define NPOINTS 256
#define NSTAGES 8

int data_real[256];
int data_imag[256];
int coef_real[256];
int coef_imag[256];

void kernel(int data_real[], int data_imag[], int coef_real[], int coef_imag[]);

int main() {
  int i;
  for (i = 0; i < NPOINTS; ++i) {
    data_real[i] = i; data_imag[i] = 1;
    coef_real[i] = 2; coef_imag[i] = 2;
  }
  kernel(data_real, data_imag, coef_real, coef_imag);
  return 0;
}

void kernel(int data_real[], int data_imag[], int coef_real[], int coef_imag[]) {
  int i, j, k;
  int temp_real, temp_imag, Wr, Wi;
  int groupsPerStage = 1;
  int buttersPerGroup = NPOINTS / 2;
  int coef_base = 0;
  for (i = 0; i < NSTAGES; ++i) {
    for (j = 0; j < groupsPerStage; ++j) {
      Wr = coef_real[coef_base + j];
      Wi = coef_imag[coef_base + j];
      int base_lo = 2 * j * buttersPerGroup;
      int base_hi = base_lo + buttersPerGroup;
      for (k = 0; k < buttersPerGroup; k += 2) {
        temp_real = Wr * data_real[base_hi+k] - Wi * data_imag[base_hi+k];
        temp_imag = Wi * data_real[base_hi+k] + Wr * data_imag[base_hi+k];
        data_real[base_hi+k] = data_real[base_lo+k] - temp_real;
        data_real[base_lo+k] += temp_real;
        data_imag[base_hi+k] = data_imag[base_lo+k] - temp_imag;
        data_imag[base_lo+k] += temp_imag;

        temp_real = Wr * data_real[base_hi+k+1] - Wi * data_imag[base_hi+k+1];
        temp_imag = Wi * data_real[base_hi+k+1] + Wr * data_imag[base_hi+k+1];
        data_real[base_hi+k+1] = data_real[base_lo+k+1] - temp_real;
        data_real[base_lo+k+1] += temp_real;
        data_imag[base_hi+k+1] = data_imag[base_lo+k+1] - temp_imag;
        data_imag[base_lo+k+1] += temp_imag;
      }
    }
    groupsPerStage *= 2;
    buttersPerGroup /= 2;
    coef_base = (coef_base << 1) + 1;
  }
}
