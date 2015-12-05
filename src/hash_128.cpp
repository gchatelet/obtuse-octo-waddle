#include <cstdlib>
#include <cstdio>

#include "MurmurHash3.h"

#define BYTETOBINARYPATTERN "%d%d%d%d%d%d%d%d"
#define BYTETOBINARY(byte)                                                     \
  (byte & 0x80 ? 1 : 0), (byte & 0x40 ? 1 : 0), (byte & 0x20 ? 1 : 0),         \
      (byte & 0x10 ? 1 : 0), (byte & 0x08 ? 1 : 0), (byte & 0x04 ? 1 : 0),     \
      (byte & 0x02 ? 1 : 0), (byte & 0x01 ? 1 : 0)

int main(int argc, char const *argv[]) {
  char *line = nullptr;
  size_t size;
  unsigned char hash[16]; // 128 / 8
  while (getline(&line, &size, stdin) != -1) {
    MurmurHash3_x64_128(line, size, 0, hash);
    for (size_t i = 0; i < sizeof(hash); ++i) {
      printf(BYTETOBINARYPATTERN, BYTETOBINARY(hash[i]));
    }
    printf("\n");
  }
  return EXIT_SUCCESS;
}
