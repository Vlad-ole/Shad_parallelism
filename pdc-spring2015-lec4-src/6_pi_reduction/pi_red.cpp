#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <chrono>
#include <omp.h>

double PI25DT = 3.141592653589793238462643;
int nsteps = 400000000;

struct threadparams {
    double sum;
    double padding[7]; // Padding for cacheline size (64 bytes)
};

double run_serial()
{
    std::chrono::high_resolution_clock::time_point start, end;    
    start = std::chrono::high_resolution_clock::now();
    double step = 1.0 / (double)nsteps;

    double sum = 0.0;
    for (int i = 1; i <= nsteps; i++) {
        double x = (i - 0.5) * step;
        sum = sum + 4.0 / (1.0 + x * x);
    }
    double pi = step * sum; 
    end = std::chrono::high_resolution_clock::now(); 
    int t = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();    

    printf("PI (serial) = %.16f, error is %.16f\n", pi, fabs(pi - PI25DT));
    double tsec = static_cast<double>(t) * 1E-6;
    printf("Elapsed time (serial): %.6f sec.\n", tsec);
    return tsec;
}

double run_parallel()
{
    double t = omp_get_wtime();    
    double step = 1.0 / (double)nsteps;

    int nthreads = omp_get_max_threads();
    double sum = 0.0;
    #pragma omp parallel for reduction (+:sum) num_threads(nthreads)
    for (int i = 1; i <= nsteps; i++) {
        double x = (i - 0.5) * step;
        sum += 4.0 / (1.0 + x * x);
    }
    double pi = step * sum; 

    t = omp_get_wtime() - t;
    printf("PI (parallel #%d) = %.16f, error is %.16f\n", nthreads, pi, fabs(pi - PI25DT));
    printf("Elapsed time (parallel) = %.6f sec.\n", t);     
    return t;
}

int main(int argc, char **argv)
{
    double tser = run_serial();
    double tpar = run_parallel();
    printf("Speedup: %.2f\n", tser / tpar); 
    return 0;
}
