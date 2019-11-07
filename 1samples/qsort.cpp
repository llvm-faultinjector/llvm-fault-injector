static void swap(char* a, char* b, size_t width) {
  if (a != b) {
    while (width--) {
      char const tmp = *a;
      *a++ = *b;
      *b++ = tmp;
    }
  }
}

static void shortsort(char* lo, char* hi, size_t const width,
                      int (*comp)(void const*, void const*)) {
  while (hi > lo) {
    char* max = lo;
    for (char* p = lo + width; p <= hi; p += width)
      if (comp(p, max) > 0) max = p;
    swap(max, hi, width);
    hi -= width;
  }
}

extern void __marking_faultinject_charptr(char*);


#define CUTOFF 8
#define STKSIZ (8 * sizeof(void*) - 2)

void qsort(void* const base, size_t const num, size_t const width,
           int (*const comp)(void const*, void const*)) {
  char* lostk[STKSIZ];
  char* histk[STKSIZ];
  int stkptr = 0;

  if (num < 2) return;
  char* lo = static_cast<char*>(base);
  char* hi = static_cast<char*>(base) + width * (num - 1);

__marking_faultinject_charptr(lo);
recurse:

  size_t const size = (hi - lo) / width + 1;

  if (size <= CUTOFF) {
    shortsort(lo, hi, width, comp);
  } else {
    char* mid = lo + (size / 2) * width;

    if (comp(lo, mid) > 0) swap(lo, mid, width);

    if (comp(lo, hi) > 0) swap(lo, hi, width);

    if (comp(mid, hi) > 0) swap(mid, hi, width);

    char* loguy = lo;
    char* higuy = hi;

    for (;;) {
      if (mid > loguy) {
        do {
          loguy += width;
        } while (loguy < mid && comp(loguy, mid) <= 0);
      }
      if (mid <= loguy) {
        do {
          loguy += width;
        } while (loguy <= hi && comp(loguy, mid) <= 0);
      }

      do {
        higuy -= width;
      } while (higuy > mid && comp(higuy, mid) > 0);

      if (higuy < loguy) break;

      swap(loguy, higuy, width);

      if (mid == higuy) mid = loguy;
    }

    higuy += width;
    if (mid < higuy) {
      do {
        higuy -= width;
      } while (higuy > mid && comp(higuy, mid) == 0);
    }
    if (mid >= higuy) {
      do {
        higuy -= width;
      } while (higuy > lo && comp(higuy, mid) == 0);
    }

    if (higuy - lo >= hi - loguy) {
      if (lo < higuy) {
        lostk[stkptr] = lo;
        histk[stkptr] = higuy;
        ++stkptr;
      }

      if (loguy < hi) {
        lo = loguy;
        goto recurse;
      }
    } else {
      if (loguy < hi) {
        lostk[stkptr] = loguy;
        histk[stkptr] = hi;
        ++stkptr;
      }

      if (lo < higuy) {
        hi = higuy;
        goto recurse;
      }
    }
  }

  --stkptr;
  if (stkptr >= 0) {
    lo = lostk[stkptr];
    hi = histk[stkptr];
    goto recurse;
  }
}

int main() {}