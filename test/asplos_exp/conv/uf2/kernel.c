/* conv standalone: out += A[i] * B[i], N=1024, manually unrolled x2 */
#define N 1024

void kernel(const int *A, const int *B, int *out);

int main(void)
{
  static int A[N], B[N];
  int out = 0;
  int i;
  for (i = 0; i < N; i++) { A[i] = i + 1; B[i] = i + 2; }
  kernel(A, B, &out);
  return 0;
}

void kernel(const int *A, const int *B, int *out)
{
  int i;
  *out = 0;
  for (i = 0; i < N; i += 2) {
    *out += A[i] * B[i] + A[i + 1] * B[i + 1];
  }
}
