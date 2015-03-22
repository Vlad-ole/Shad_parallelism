#include <cstdio>
#include <omp.h>
#include <pthread.h>

void level2()
{
    printf("L2 nthreads = %d\n", omp_get_num_threads());

    // Activates nested team of 2 threads (master + new)
    #pragma omp parallel sections
    {
        #pragma omp section
        {
            printf("L2 S1 Thread %d/%d (PID %u)\n", omp_get_thread_num(), omp_get_num_threads(), (unsigned int)pthread_self());
        }
        #pragma omp section
        {
            printf("L2 S2 Thread %d/%d (PID %u)\n", omp_get_thread_num(), omp_get_num_threads(), (unsigned int)pthread_self());
        }
    }
}

void level1()
{
    printf("Main thread TID: %u\n", (unsigned int)pthread_self());

    // Activates team of 2 threads (master thread + new)
    #pragma omp parallel sections num_threads(2) 
    {
        #pragma omp section
        {
            printf("L1 S1 Thread %d/%d (PID %u)\n", omp_get_thread_num(), omp_get_num_threads(), (unsigned int)pthread_self());
            level2();
        }
        #pragma omp section
        {
            printf("L1 S2 Thread %d/%d (PID %u)\n", omp_get_thread_num(), omp_get_num_threads(), (unsigned int)pthread_self());
            level2();
        }
    }
}

int main() 
{
    omp_set_dynamic(0);
    omp_set_nested(1);
    level1();    
    return 0;
}
