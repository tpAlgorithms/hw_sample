#include <cstdio>

void make_primes(int max_prime, int *data) {
  for (int pos = 0; pos < max_prime; ++pos) {
    data[pos] = 1; 
  }

  for (int pos = 2; pos < max_prime; ++pos) {
    if (data[pos] == 0) {
      continue;
    }
    for (int candidate = pos * 2; candidate < max_prime; candidate += pos) {
      //printf("%d %d\n", pos, candidate);
      data[candidate] = 0;
    }
  }
}

int main() {
  int max_prime = 10;
  scanf("%d", &max_prime);
  int *data = new int[max_prime];
  make_primes(max_prime, data);

  for (int pos = 2; pos < max_prime; ++pos) {
    if (data[pos] != 0) {
      printf("%d ", pos);
    }
  }
  delete [] data;

  return 0;
}
