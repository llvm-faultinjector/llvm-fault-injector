#include <stdio.h>

extern void __marking_faultinject_int(int);

extern void __marking_faultinject_intptr(int*);

void bubble_sort(int arr[], int n)
{
  int i, j, tmp;
  __marking_faultinject_intptr(&j);
  for (i = 0; i < n - 1; i++)
    for (j = 0; j < n - i - 1; j++)
      if (arr[j] > arr[j + 1]) {
        tmp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = tmp;
      }
}

int main(int argc, char *argv[])
{
  int arr[] = { 7,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,2,1,0,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,2,
                1,0,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,2,1,0,8,0,5,4,1,2,4,3,10,99,55,10,0,1,9,8,7,6,5,4,3,
                2,1,0 };
  int n = sizeof(arr) / sizeof(int);
  bubble_sort(arr, n);
  for (int i = 0; i < n; i++)
    printf("%d ", arr[i]);
}

//extern void __marking_faultinject_intptr(int*);
//int main(int argc, char *argv[])
//{
//  int  b = 1;
//  __marking_faultinject_intptr(&b);
//  for (int i = 1; i < argc; i++) {
//    b *= i;
//  }
//  printf("%d", b);
//}