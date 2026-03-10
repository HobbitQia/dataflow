/* FIR filter: pragma unroll_count(2) */
#define NTAPS 32

int input[NTAPS];
int output[NTAPS];
int coefficients[NTAPS] = {
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1,
    0, 1, 3, -2, 0, 0, -3, 1};

int kernel(int input[], int output[], int coefficient[]);

int main()
{
  int returned_value = kernel(input, output, coefficients);
  output[0] = returned_value;
  return 0;
}

int kernel(int input[], int output[], int coefficient[])
{
  int i;
  int sum = 0;
#pragma clang loop unroll_count(2)
  for (i = 0; i < NTAPS; ++i) {
    sum += input[i] * coefficient[i];
  }
  return sum;
}
