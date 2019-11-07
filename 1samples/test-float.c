#include <stdio.h>

extern void __marking_faultinject_float(float *d);

static int a = 0;

float test(float x)
{
  for (int i = 0; i < 1000; i++)
  {
    __marking_faultinject_float(&x);
    x += 10.0;
    if (x > 100.0)
      x /= 10;
  }
  return x;
}

float cast(float x)
{
  unsigned int * xx = (unsigned int*) &x;
  xx[0] ^= 1;
  return x;
}

int main()
{
}