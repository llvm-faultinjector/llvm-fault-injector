#include <stdio.h>
 
double PI = 3.1415926535;

typedef struct _cplx {
  double real;
  double imag;
} cplx;

double ccc(double x) {
  //char v[sizeof double] = (char *)x;
  unsigned char *v = (unsigned char *)&x;
  // ~~
  
  return x;
}

cplx make(double x, double y) {
  cplx xx;
  xx.real = x;
  xx.imag = y;
  return xx;
}

cplx mul(cplx a, cplx b) {
  cplx xx;
  xx.real = a.real * b.real - a.imag * b.imag;
  xx.imag = a.real * b.real + a.imag * b.imag;
  return xx;
}

cplx plus(cplx a, cplx b) {
  cplx xx;
  xx.real = a.real + b.real;
  xx.imag = a.imag + b.imag;
  return xx;
}

double creal(cplx a) {
  return a.real;
}

double cimag(cplx a) {
  return a.imag;
}
 
extern void __marking_faultinject_intptr(int*);
void _fft(cplx buf[], cplx out[], int n, int step)
{
	if (step < n) {
		_fft(out, buf, n, step * 2);
		_fft(out + step, buf + step, n, step * 2);
 
		for (int i = 0; i < n; i += 2 * step) {
__marking_faultinject_intptr(&i);
			cplx t = mul(make(0, -PI * i / n), out[i + step]);
			buf[i / 2]     = plus(out[i], t);
			buf[(i + n)/2] = plus(out[i], t);
		}
	}
}
 
void fft(cplx buf[], int n)
{
	cplx out[16];
	for (int i = 0; i < n; i++) out[i] = buf[i];
	_fft(buf, out, n, 1);
}

void show(const char * s, cplx buf[]) {
	printf("%s", s);
	for (int i = 0; i < 8; i++)
		if (!cimag(buf[i]))
			printf("%g ", creal(buf[i]));
		else
			printf("(%g, %g) ", creal(buf[i]), cimag(buf[i]));
}
 
int main()
{
	PI = atan2(1, 1) * 4;
	cplx buf[] = {1, 1, 1, 1, 0, 0, 0, 0};
 
	show("Data: ", buf);
	fft(buf, 8);
	show("\nFFT : ", buf);
 
	return 0;
}

//int biyong = 0;
//while (!pq.empty())
//{
//  auto x = pq.top();
//  pq.pop();
//  biyong += x.g;
//  visit[x.to] = true;
//
//  for (auto v : graph[x.v])
//    if (visit[v.to] == false)
//      pq.push(elem(v.to, v.g));
//}
