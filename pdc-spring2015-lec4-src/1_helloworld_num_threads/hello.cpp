#include <iostream>
#include <omp.h>

int main(int argc, char **argv) 
{
    int nthreads, threadid;

//  #pragma omp parallel num_threads(8)
    #pragma omp parallel private(threadid) num_threads(8)
    {
        threadid = omp_get_thread_num();
        printf("%d: Hello, OpenMP World\n", threadid);

        if (threadid == 0) {
            nthreads = omp_get_num_threads();
            printf("Number of threads = %d\n", nthreads);
        }
    }
    return 0;
}
