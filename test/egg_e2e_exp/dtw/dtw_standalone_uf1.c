/* dtw standalone: integer, SIZE=512, inner x-loop as CGRA kernel
 * pragma unroll_count(1) */
#define SIZE 512

int S[SIZE];
int T[SIZE];
int DTW_TBL[SIZE + 1][SIZE + 1];

void kernel(int S[], int T[], int DTW_TBL[][SIZE + 1], int i);

int main(void)
{
  int i;
  for (i = 0; i < SIZE; i++) { S[i] = i + 1; T[i] = i + 3; }
  for (i = 0; i <= SIZE; i++) { DTW_TBL[i][0] = 65535; DTW_TBL[0][i] = 65535; }
  DTW_TBL[0][0] = 0;
  for (i = 1; i < SIZE; i++)
    kernel(S, T, DTW_TBL, i);
  return 0;
}

void kernel(int S[], int T[], int DTW_TBL[][SIZE + 1], int i)
{
  int x;
#pragma clang loop unroll_count(1)
  for (x = 1; x < SIZE; x++) {
    int cost = S[i] - T[x];
    cost = cost * cost;
    int a = DTW_TBL[i][x];
    int b = DTW_TBL[i + 1][x];
    int c = DTW_TBL[i][x - 1 + 1];
    int min = a;
    if (b < min) min = b;
    if (c < min) min = c;
    DTW_TBL[i + 1][x + 1] = cost + min;
  }
}
