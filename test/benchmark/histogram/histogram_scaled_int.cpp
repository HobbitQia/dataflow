#ifndef DATA_LEN
#define DATA_LEN 1024
#endif

#ifndef BUCKET_LEN
#define BUCKET_LEN 32
#endif

void kernel(int input[], int histogram[]);

void kernel(int input[], int histogram[]) {
  for (int i = 0; i < DATA_LEN; ++i) {
    int bucket = input[i] % BUCKET_LEN;
    histogram[bucket] = histogram[bucket] + 1;
  }
}
