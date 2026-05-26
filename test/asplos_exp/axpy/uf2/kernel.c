/* axpy standalone: y = a*x + y, N=1024, manually unrolled x2 */
#define N 1024
#define A 3

void kernel(const int *x, int *y);

int main(void)
{
  static int x[N], y[N];
  int i;
  for (i = 0; i < N; i++) { x[i] = i; y[i] = i % 7; }
  kernel(x, y);
  return 0;
}

void kernel(const int *x, int *y)
{
  int i;
  for (i = 0; i < N; i += 2) {
    y[i]     = A * x[i]     + y[i];
    y[i + 1] = A * x[i + 1] + y[i + 1];
  }
}
