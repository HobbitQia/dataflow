/* gemm standalone: C += A*B, NI=NJ=NK=64, manually unrolled x1 on j-loop */
#define NI 64
#define NJ 64
#define NK 64

void kernel(int *C, int *A, int *B);

int main(void)
{
  static int C[NI * NJ];
  static int A[NI * NK];
  static int B[NK * NJ];
  int i, j;
  for (i = 0; i < NI; i++)
    for (j = 0; j < NJ; j++) { C[i*NJ+j] = 0; A[i*NK+j] = i+j; B[i*NJ+j] = i-j; }
  kernel(C, A, B);
  return 0;
}

void kernel(int *C, int *A, int *B)
{
  int i, j, k;
  for (i = 0; i < NI; i++) {
    for (k = 0; k < NK; k++) {
      for (j = 0; j < NJ; j++)
        C[i*NJ+j] += A[i*NK+k] * B[k*NJ+j];
    }
  }
}
