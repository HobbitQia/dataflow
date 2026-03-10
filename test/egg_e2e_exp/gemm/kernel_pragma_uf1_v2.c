/* gemm v2: 2-loop version (merged i*NK+k iteration), pointer args
 * NI=NJ=NK=64, pragma unroll_count(1) on innermost j-loop */
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
  int ik;
  for (ik = 0; ik < NI * NK; ik++) {
    int i = ik / NK;
    int k = ik % NK;
#pragma clang loop vectorize(disable) unroll_count(1)
    for (int j = 0; j < NJ; j++)
      C[i*NJ+j] += A[ik] * B[k*NJ+j];
  }
}
