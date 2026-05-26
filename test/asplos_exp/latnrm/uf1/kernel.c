/* latnrm standalone: 8th-order normalized lattice filter, int arithmetic, manually unrolled x1 */
#define ORDER 8

void kernel(int *state, const int *coefficient);

int main(void)
{
  static int coefficient[16] = {25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560};
  static int state[ORDER + 4];
  int i;
  for (i = 0; i < ORDER + 4; i++) { state[i] = i + 1; }
  kernel(state, coefficient);
  return 0;
}

void kernel(int *state, const int *coefficient)
{
  int i;
  for (i = 0; i < ORDER; i++) {
    int k_coef = coefficient[2 * i];
    int q_coef = coefficient[2 * i + 1];
    int left = state[0];
    int right = state[i + 2];
    state[i + 2] = state[1];
    state[0] = q_coef * left - k_coef * right;
    state[1] = q_coef * right + k_coef * left;
  }
}
