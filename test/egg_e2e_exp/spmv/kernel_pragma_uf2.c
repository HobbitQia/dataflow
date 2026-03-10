/* spmv.c: pragma unroll_count(2) with large nnz */
#define SIZE 10000

int nnz = 1024;
int val[SIZE];
int col[SIZE];
int row[SIZE];
int feature[SIZE];
int output[SIZE];

void kernel(int nnz, int val[], int col[], int row[], int feature[], int output[]);

int main()
{
  int i;
  for (i = 0; i < nnz; i++) {
    val[i] = i % 7 + 1;
    col[i] = i % SIZE;
    row[i] = i % SIZE;
    feature[i] = i % 13;
  }
  kernel(nnz, val, col, row, feature, output);
  return 0;
}

void kernel(int nnz, int val[], int col[], int row[], int feature[], int output[])
{
  int i = 0;
  int temp;
#pragma clang loop unroll_count(2)
  for (i = 0; i < nnz; ++i) {
    temp = val[i] * feature[ col[i] ];
    output[ row[i] ] += temp;
  }
}
