/* relu standalone: C = max(0, A), NI=NJ=64, manually unrolled x1 on j-loop */
#define NI 64
#define NJ 64

void kernel(int *A, int *C);

int main(void)
{
  static int A[NI * NJ];
  static int C[NI * NJ];
  int i;
  for (i = 0; i < NI * NJ; i++)
    A[i] = i % 17 - 8;
  kernel(A, C);
  return 0;
}

void kernel(int *A, int *C)
{
  int i, j;
  for (i = 0; i < NI; i++) {
    for (j = 0; j < NJ; j++) {
      int idx = i * NJ + j;
      C[idx] = A[idx] < 0 ? 0 : A[idx];
    }
  }
}
