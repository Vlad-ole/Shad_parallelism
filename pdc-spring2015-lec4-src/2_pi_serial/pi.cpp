#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <chrono>

int main(int argc, char **argv)
{
    double PI25DT = 3.141592653589793238462643;
    double pi, x, step, sum;
    int i, nsteps;
    std::chrono::high_resolution_clock::time_point start, end;
    
    start = std::chrono::high_resolution_clock::now();
    nsteps = (argc > 1) ? atoi(argv[1]) : 100000000;
    step = 1.0 / (double)nsteps;

    sum = 0.0;
    for (i = 1; i <= nsteps; i++) {
        x = (i - 0.5) * step;
        sum = sum + 4.0 / (1.0 + x * x);
    }
    pi = step * sum; 
    end = std::chrono::high_resolution_clock::now(); 
    int t = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();    

    printf("PI is approximately %.16f, Error is %.16f\n", pi, fabs(pi - PI25DT));
    printf("(nsteps = %d, step = %f)\n", nsteps, step);
    double tsec = static_cast<double>(t) * 1E-6;
    printf("Elapsed time (serial): %.6f sec.\n", tsec);
 
    return 0;
}

