#include <algorithm>
#include <cstdio>
#include <omp.h>

const int size = 8 * 1024 * 1024;
const int threshold = 100;
int array[size];

void partition(int *v, int& i, int& j, int low, int high)
{
    i = low;
    j = high;
    int pivot = v[(low + high) / 2];
   
    do {
        while (v[i] < pivot) 
            i++;
        while (v[j] > pivot) 
            j--;
        if (i <= j) {
            std::swap(v[i], v[j]);
            i++;
            j--;
        }
    } while (i <= j);
}

void quicksort(int *v, int low, int high) 
{
    int i, j;
    partition(v, i, j, low, high);

    if (low < j)
        quicksort(v, low, j);
    if (i < high)
        quicksort(v, i, high);
}

void quicksort_nested(int *v, int low, int high) 
{
    int i, j;
    partition(v, i, j, low, high);

    if (high - low < threshold || (j - low < threshold || high - i < threshold)) {
        // Serial sorting
        if (low < j)
            quicksort_nested(v, low, j);
        if (i < high)
            quicksort_nested(v, i, high);
    } else {
        #pragma omp parallel sections num_threads(2)
        {
            #pragma omp section
            {
                //printf("S1 level %d - TID %d (%u): [%d - %d]\n", omp_get_level(), omp_get_thread_num(), (int)pthread_self(), low, j);
                quicksort_nested(v, low, j);
            }
            #pragma omp section
            {
                //printf("S2 level %d - TID %d (%u): [%d - %d]\n", omp_get_level(), omp_get_thread_num(), (int)pthread_self(), i, high);
                quicksort_nested(v, i, high);
            }
        }
    }
}

void quicksort_tasks(int *v, int low, int high) 
{
    int i, j;
    partition(v, i, j, low, high);

    if (high - low < threshold || (j - low < threshold || high - i < threshold)) {
        if (low < j)
            quicksort_tasks(v, low, j);
        if(i < high)
            quicksort_tasks(v, i, high);
    } else {
        #pragma omp task
        {
            quicksort_tasks(v, low, j);
        }
        quicksort_tasks(v, i, high);
    }
}

void fillarray(int *v, int size)
{
    for (int i = 0; i < size; ++i)
        v[i] = rand() % 10000;
}

bool check_is_sorted(int *v, int size)
{
    for (int i = 1; i < size; ++i)
        if (v[i - 1] > v[i]) {
            printf("Array is not sorted!\n");
            return false;
        }
    return true;
}

int main() 
{
    fillarray(array, size);
    double tser = omp_get_wtime();
    quicksort(array, 0, size - 1);
    tser = omp_get_wtime() - tser;
    printf("Elapsed time (serial): %.6f sec.\n", tser);
    check_is_sorted(array, size);
    
    fillarray(array, size);
    omp_set_nested(1); // Enable nested parallel regions
    omp_set_max_active_levels(12); // Maximum allowed number of nested, active parallel regions
    double tnested = omp_get_wtime();
    quicksort_nested(array, 0, size - 1);
    tnested = omp_get_wtime() - tnested;
    printf("Elapsed time (nested sections): %.6f sec.\n", tnested);
    printf("Speedup (nested): %.2f\n", tser / tnested);
    check_is_sorted(array, size);

    fillarray(array, size);
    omp_set_nested(0);
    double ttasks = omp_get_wtime();
    #pragma omp parallel
    {
        #pragma omp single
        quicksort_tasks(array, 0, size - 1);
    }
    ttasks = omp_get_wtime() - ttasks;
    printf("Elapsed time (tasks): %.6f sec.\n", ttasks);
    printf("Speedup (tasks): %.2f\n", tser / ttasks);
    check_is_sorted(array, size);
    
    return 0;
}
