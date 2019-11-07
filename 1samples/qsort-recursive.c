#include <stdio.h>

extern void __marking_faultinject_intptr(int*);

/*void qsort(void *v[], int left, int right, int (*comp)(void *, void *)) {
  int i, last;
  void swap(void *v[], int, int);

  if (left >= right) return;
  swap(v, left, (left + right) / 2);
  last = left;
  for (i = left + 1; i <= right; i++)
  {
    __marking_faultinject_intptr(&i);
    if ((*comp)(v[i], v[left]) < 0)
      swap(v, ++last, i);
  }
  swap(v, left, last);
  qsort(v, left, last - 1, comp);
  qsort(v, last + 1, right, comp);
}*/


void swap(int v[], int, int);

void qsort(int v[], int left, int right) {
  int i, last;

  if (left >= right) return;
  swap(v, left, (left + right) / 2);
  last = left;
  for (i = left + 1; i <= right; i++)
  {
    __marking_faultinject_intptr(&i);
    if (v[i] < v[left])
      swap(v, ++last, i);
  }
  swap(v, left, last);
  qsort(v, left, last - 1);
  qsort(v, last + 1, right);
}

void swap(int v[], int a, int b){
  int t = v[a];
  v[a] = v[b];
  v[b] = t;
}

int main() { 
  int arr[] = { 7,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,2,1,0,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,2,
                1,0,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,2,1,0,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,
                2,1,0 };
  int n = sizeof(arr) / sizeof(int);
  qsort(arr, 0, n-1);
  for (int i = 0; i < n; i++)
    printf("%d ", arr[i]);
  return 0; 
}