#include <stdlib.h>
#include <stdio.h>

#define DATA_LEN 20
#define BUCKET_LEN 5
#define MIN 1
#define MAX 19

void kernel(int input_data[], int histogram[]);

int input_data[DATA_LEN] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,14,14,14,14,14,19};
int histogram[BUCKET_LEN] = {0};

int main(int argc, char** argv) {
  kernel(input_data, histogram);
  return 0;
}

void kernel(int input[], int histogram[]) {
  int i;
  int dmin = MIN;
  int delt = MAX - dmin;
  for (i = 0; i < DATA_LEN; i += 2) {
    int r0 = BUCKET_LEN * (input[i] - dmin) / delt;
    histogram[r0]++;
    int r1 = BUCKET_LEN * (input[i+1] - dmin) / delt;
    histogram[r1]++;
  }
}
