#include <stdio.h>

extern void __marking_faultinject_double(double *d);

static int a = 0;

double test(double x)
{
  for (int i = 0; i < 1000; i++)
  {
    __marking_faultinject_double(&x);
    x += 10.0;
    if (x > 100.0)
      x /= 10;
  }
  return x;
}

int main()
{
}