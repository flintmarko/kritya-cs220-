#include <stdio.h>
#include <stdlib.h>
void swap(float *a, float *b)
{
    float t = *a;
    *a = *b;
    *b = t;
}
void ins_srt(float *arr, int sz)
{
    for (int i = 1; i < sz; i++)
    {
        for (int j = i - 1; j >= 0; j--)
        {
            if (arr[j + 1] > arr[j])
                break;
            swap(arr + j + 1, arr + j);
        }
    }
}
float *Bucket(float *brr, int p, int n)
{
    float buck[n][p];
    int d[n];
    for (int i = 0; i < n; i++)
        d[i] = 0;
    // fill the water
    for (int i = 0; i < p; i++)
    {
        buck[(int)(n * brr[i])][d[(int)(n * brr[i])]] = brr[i];
        d[(int)(n * brr[i])]++;
    }
    // removing mud from each baalti
    for (int i = 0; i < n; i++)
    {
        ins_srt(buck[i], d[i]);
    }
    // fill the tank with clean h2O
    float *final_ans = (float *)malloc(p * sizeof(float));
    int ans_indx = 0;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < d[i]; j++)
        {
            final_ans[ans_indx] = buck[i][j];
            ans_indx++;
        }
    }
    return final_ans;
}
int main()
{
    int n, p;
    scanf("%d %d", &n, &p);
    float arr[p];
    for (int i = 0; i < p; i++)
    {
        scanf("%f", arr + i);
    }
    float *ans;
    ans = Bucket(arr, p, n);
    for (int i = 0; i < p; i++)
        printf("%f ", ans[i]);
    return 0;
}