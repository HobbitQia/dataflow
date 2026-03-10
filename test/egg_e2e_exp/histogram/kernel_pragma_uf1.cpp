#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <unistd.h>

/* Use larger DATA_LEN to avoid full loop elimination by compiler */
#define DATA_LEN 1024
#define BUCKET_LEN 16
#define MIN 0
#define MAX 1023

void kernel(int input_data[], int histogram[]);

int input_data[DATA_LEN];
int histogram[BUCKET_LEN] = {0};

int main(int argc, char** argv) {
  int i;
  for (i = 0; i < DATA_LEN; i++)
    input_data[i] = i % (MAX - MIN + 1) + MIN;
  kernel(input_data, histogram);
  return 0;
}

void kernel(int input[], int histogram[]) {
  int i;
  int dmin = MIN;
  int delt = MAX - dmin;
#pragma clang loop unroll_count(1)
  for (i = 0; i < DATA_LEN; i++) {
    int r = BUCKET_LEN * (input[i] - dmin) / delt;
    int b = r;
    histogram[b]++;
  }
}
