/* gemm_v2: merged i,k loop as outer, j-loop as CGRA kernel
 * NI=NJ=NK=64, pointer args, pragma unroll_count(2) on j-loop */
#define NI 64
#define NJ 64
#define NK 64

void kernel(int *C, int *A, int *B, int i, int k);

int main(void)
{
  static int C[NI * NJ];
  static int A[NI * NK];
  static int B[NK * NJ];
  int i, j;
  for (i = 0; i < NI; i++)
    for (j = 0; j < NJ; j++) { C[i*NJ+j] = 0; A[i*NK+j] = i+j; B[i*NJ+j] = i-j; }
  for (i = 0; i < NI; i++)
    for (j = 0; j < NK; j++)
      kernel(C, A, B, i, j);
  return 0;
}

void kernel(int *C, int *A, int *B, int i, int k)
{
  int j;
  int a_ik = A[i * NK + k];
#pragma clang loop unroll_count(2)
  for (j = 0; j < NJ; j++)
    C[i * NJ + j] += a_ik * B[k * NJ + j];
}
