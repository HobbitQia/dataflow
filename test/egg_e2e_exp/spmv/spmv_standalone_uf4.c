/* spmv standalone: pointer args, NNZ as compile-time constant
 * pragma unroll_count(4) */
#define NNZ 1024
#define SIZE 1024

void kernel(int *val, int *col, int *row, int *feature, int *output);

int main(void)
{
  static int val[NNZ], col[NNZ], row[NNZ];
  static int feature[SIZE], output[SIZE];
  int i;
  for (i = 0; i < NNZ; i++) {
    val[i] = i % 7 + 1;
    col[i] = i % SIZE;
    row[i] = i % SIZE;
  }
  for (i = 0; i < SIZE; i++)
    feature[i] = i % 13;
  kernel(val, col, row, feature, output);
  return 0;
}

void kernel(int *val, int *col, int *row, int *feature, int *output)
{
  int i;
#pragma clang loop unroll_count(4)
  for (i = 0; i < NNZ; i++) {
    output[row[i]] += val[i] * feature[col[i]];
  }
}
