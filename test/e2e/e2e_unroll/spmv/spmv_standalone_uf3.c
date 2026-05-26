/* spmv standalone: sparse matrix-vector multiply, NNZ=1024, manually unrolled x3 */
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
  for (i = 0; i + 2 < NNZ; i += 3) {
    output[row[i]]     += val[i]     * feature[col[i]];
    output[row[i + 1]] += val[i + 1] * feature[col[i + 1]];
    output[row[i + 2]] += val[i + 2] * feature[col[i + 2]];
  }
  for (; i < NNZ; i++) {
    output[row[i]] += val[i] * feature[col[i]];
  }
}
