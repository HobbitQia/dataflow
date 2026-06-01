#ifndef N
#define N 256
#endif

#ifndef NTAPS
#define NTAPS 32
#endif

void kernel(int input[], int output[], int coefficient[]);

void kernel(int input[], int output[], int coefficient[]) {
  for (int i = 0; i < N; ++i) {
    int acc = 0;
    for (int t = 0; t < NTAPS; ++t) {
      acc += input[i + t] * coefficient[t];
    }
    output[i] = acc;
  }
}
