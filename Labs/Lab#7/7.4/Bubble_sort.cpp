#include<iostream>
using namespace std;
void Bubble_sort(int a[], int n){
    for(int i = 0; i < n; i++){
        for(int j = 0; j < n ; j++){
            if(a[j] > a[j + 1]){
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
}
int main(){
    int a[10] = {1, 3, 5, 7, 9, 2, 4, 6, 8, 10};
    Bubble_sort(a, 10);
    for(int i = 0; i < 10; i++){
        cout << a[i] << " ";
    }
    return 0;
}