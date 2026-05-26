/* histogram standalone: integer, DATA_LEN=1024, BUCKET_LEN=16, manually unrolled x2 */
#define DATA_LEN 1024
#define BUCKET_LEN 16
#define MIN 0
#define MAX 1023

void kernel(int *input, int *histogram);

int input_data[DATA_LEN];
int hist[BUCKET_LEN];

int main(void)
{
  int i;
  for (i = 0; i < DATA_LEN; i++)
    input_data[i] = i % (MAX - MIN + 1) + MIN;
  for (i = 0; i < BUCKET_LEN; i++)
    hist[i] = 0;
  kernel(input_data, hist);
  return 0;
}

void kernel(int *input, int *histogram)
{
  int i;
  int dmin = MIN;
  int delt = MAX - dmin;
  for (i = 0; i < DATA_LEN; i += 2) {
    int r0 = BUCKET_LEN * (input[i] - dmin) / delt;
    int b0 = r0;
    histogram[b0]++;

    int r1 = BUCKET_LEN * (input[i + 1] - dmin) / delt;
    int b1 = r1;
    histogram[b1]++;
  }
}
