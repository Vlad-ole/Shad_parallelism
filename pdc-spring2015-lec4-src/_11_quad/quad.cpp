#include <cstdio>
#include <cmath>
#include <omp.h>

const long double eps = 1E-24;
const double threshold = 0.05;
double pi_real = 3.141592653589793238462643;

long double f(double x) {
    return 4.0 / (1.0 + x * x);
}

long double quad(double left, double right, long double f_left, long double f_right, 
                 long double lr_area)
{
    double mid = (left + right) / 2;
    long double f_mid = f(mid);
    long double l_area = (f_left + f_mid) * (mid - left) / 2;
    long double r_area = (f_mid + f_right) * (right - mid) / 2;
    if (fabs((l_area + r_area) - lr_area) > eps) {
        l_area = quad(left, mid, f_left, f_mid, l_area);
        r_area = quad(mid, right, f_mid, f_right, r_area);
    }
    return (l_area + r_area);
}

long double quad_tasks(double left, double right, long double f_left, long double f_right,
                       long double lr_area) 
{
    double mid = (left + right) / 2;
    long double f_mid = f(mid);
    long double l_area = (f_left + f_mid) * (mid - left) / 2;
    long double r_area = (f_mid + f_right) * (right - mid) / 2;
    if (fabs((l_area + r_area) - lr_area) > eps) {
        if (right - left < threshold) {
            l_area = quad_tasks(left, mid, f_left, f_mid, l_area);
            r_area = quad_tasks(mid, right, f_mid, f_right, r_area);
        } else {
            #pragma omp task shared(l_area)
            {
                l_area = quad_tasks(left, mid, f_left, f_mid, l_area);
            }
            r_area = quad_tasks(mid, right, f_mid, f_right, r_area);
            #pragma omp taskwait
        }
    }
    return (l_area + r_area);
}

int main(int argc, char *argv[]) 
{
    double start = omp_get_wtime();
    long double pi = quad(0.0, 1.0, f(0), f(1), (f(0) + f(1)) / 2);
    printf("PI is approximately %.16Lf, Error is %.16f\n", pi, fabs(pi - pi_real));
    printf("Sequential version: %.6f sec.\n", omp_get_wtime() - start);

    start = omp_get_wtime();
    #pragma omp parallel
    #pragma omp single
    {
        pi = quad_tasks(0.0, 1.0, f(0), f(1), (f(0) + f(1)) / 2);
        printf("PI is approximately %.16Lf, Error is %.16f\n", pi, fabs(pi - pi_real));
    }
    printf("Parallel version: %.6f sec.\n", omp_get_wtime() - start);
    return 0;
}
