/* fir standalone: integer FIR filter, NTAPS=32, manually unrolled x4 */
#define NTAPS 32

int coefficients[NTAPS] = {
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1};

void kernel(int *input, int *output, int *coefficient);

int main(void)
{
  static int input[NTAPS];
  static int output[NTAPS];
  int i;
  for (i = 0; i < NTAPS; i++) input[i] = i % 5;
  kernel(input, output, coefficients);
  return 0;
}

void kernel(int *input, int *output, int *coefficient)
{
  int i;
  int sum = 0;
  for (i = 0; i < NTAPS; i += 4) {
    sum += input[i]     * coefficient[i];
    sum += input[i + 1] * coefficient[i + 1];
    sum += input[i + 2] * coefficient[i + 2];
    sum += input[i + 3] * coefficient[i + 3];
  }
  output[0] = sum;
}
