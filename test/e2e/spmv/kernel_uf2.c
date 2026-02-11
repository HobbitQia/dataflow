#define SIZE 10000

int nnz = 100;
int val[SIZE];
int col[SIZE];
int row[SIZE];
int feature[SIZE];
int output[SIZE];

void kernel(int nnz, int val[], int col[], int row[], int feature[], int output[]);

int main() {
  kernel(nnz, val, col, row, feature, output);
  return 0;
}

void kernel(int nnz, int val[], int col[], int row[], int feature[], int output[]) {
  int i;
  int temp;
  for (i = 0; i < nnz; i += 2) {
    temp = val[i] * feature[col[i]];
    output[row[i]] += temp;
    temp = val[i+1] * feature[col[i+1]];
    output[row[i+1]] += temp;
  }
}
