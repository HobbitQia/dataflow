namespace {
constexpr int kN = 1024;
constexpr int kA = 3;
}  // namespace

extern "C" void kernel_axpy_int(const int *x, int *y) {
  for (int i = 0; i < kN; ++i) {
    y[i] = kA * x[i] + y[i];
  }
}

int main() {
  static int x[kN];
  static int y[kN];
  kernel_axpy_int(x, y);
  return 0;
}
