#include <cstdio>

int main() {
  int result = 0;
  int var;

  while(scanf("%d", &var) == 1) {
    result += var;
  }
  printf("%d\n", result);
  return 0;
}
