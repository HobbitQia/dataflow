#define NTAPS 32

int input[NTAPS];
int output[NTAPS];
int coefficients[NTAPS] = {
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1};

int kernel(int input[], int output[], int coefficient[]);

int main() {
  int r = kernel(input, output, coefficients);
  output[0] = r;
  return 0;
}

int kernel(int input[], int output[], int coefficient[]) {
  int i;
  int sum = 0;
  for (i = 0; i < NTAPS; i += 4) {
    sum += input[i]   * coefficient[i];
    sum += input[i+1] * coefficient[i+1];
    sum += input[i+2] * coefficient[i+2];
    sum += input[i+3] * coefficient[i+3];
  }
  return sum;
}
