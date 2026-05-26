/* latnrm standalone: 8th-order normalized lattice filter, int arithmetic, manually unrolled x4 */
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
  for (i = 0; i < ORDER; i += 4) {
    int k0 = coefficient[2 * i];
    int q0 = coefficient[2 * i + 1];
    int left0 = state[0];
    int right0 = state[i + 2];
    state[i + 2] = state[1];
    int top0 = q0 * left0 - k0 * right0;
    int bot0 = q0 * right0 + k0 * left0;

    int k1 = coefficient[2 * (i + 1)];
    int q1 = coefficient[2 * (i + 1) + 1];
    int right1 = state[i + 3];
    state[i + 3] = bot0;
    int top1 = q1 * top0 - k1 * right1;
    int bot1 = q1 * right1 + k1 * top0;

    int k2 = coefficient[2 * (i + 2)];
    int q2 = coefficient[2 * (i + 2) + 1];
    int right2 = state[i + 4];
    state[i + 4] = bot1;
    int top2 = q2 * top1 - k2 * right2;
    int bot2 = q2 * right2 + k2 * top1;

    int k3 = coefficient[2 * (i + 3)];
    int q3 = coefficient[2 * (i + 3) + 1];
    int right3 = state[i + 5];
    state[i + 5] = bot2;
    state[0] = q3 * top2 - k3 * right3;
    state[1] = q3 * right3 + k3 * top2;
  }
}
