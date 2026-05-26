/* relu standalone: C = max(0, A), NI=NJ=64, manually unrolled x3 on j-loop */
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
    for (j = 0; j + 2 < NJ; j += 3) {
      int idx0 = i * NJ + j;
      C[idx0] = A[idx0] < 0 ? 0 : A[idx0];

      int idx1 = i * NJ + j + 1;
      C[idx1] = A[idx1] < 0 ? 0 : A[idx1];

      int idx2 = i * NJ + j + 2;
      C[idx2] = A[idx2] < 0 ? 0 : A[idx2];
    }
    for (; j < NJ; j++) {
      int idx = i * NJ + j;
      C[idx] = A[idx] < 0 ? 0 : A[idx];
    }
  }
}
