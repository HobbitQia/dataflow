namespace {
constexpr int kN = 16;
constexpr int kA = 3;
}

extern "C" void kernel_axpy_int(const int *x, int *y) {
  for (int i = 0; i < kN; i += 2) {
    y[i]   = kA * x[i]   + y[i];
    y[i+1] = kA * x[i+1] + y[i+1];
  }
}

int main() {
  static int x[kN], y[kN];
  kernel_axpy_int(x, y);
  return 0;
}
