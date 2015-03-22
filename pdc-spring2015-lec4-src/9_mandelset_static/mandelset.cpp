/**
 * Adapted from http://bisqwit.iki.fi/story/howto/openmp/
 */

#include <complex>
#include <cstdio>
#include <omp.h>

typedef std::complex<double> complex;

int MandelbrotCalculate(complex c, int maxiter)
{
    complex z = c;
    int n = 0;
    for (; n < maxiter; n++) {
        if (std::abs(z) >= 2.0)
            break;
        z = z * z + c;
    }
    return n; 
}

int main()
{
    double start = omp_get_wtime();

    const int width = 100, height = 70, npixels = width * height;
    const complex center(-0.7, 0), span(2.7, -(4 / 3.0) * 2.7 * height / width);
    const complex begin = center - span / 2.0;
    const int maxiter = 1000000;

    int pixels[npixels];
    int nthreads = omp_get_max_threads();
    double threadtime[nthreads];
    
    #pragma omp parallel num_threads(nthreads)
    {
        double t = omp_get_wtime();
        int tid = omp_get_thread_num();
        #pragma omp for schedule(static, 1) nowait
        for (int pix = 0; pix < npixels; ++pix) {
            const int x = pix % width, y = pix / width;
            complex c = begin + complex(x * span.real() / (width + 1.0),
                                        y * span.imag() / (height + 1.0));
            int n = MandelbrotCalculate(c, maxiter);
            if (n == maxiter)
                n = 0;
            pixels[pix] = n;
        }
        threadtime[tid] = omp_get_wtime() - t;
    }

    static const char charset[] = ".,c8M@jawrpogOQEPGJ";
    for (int pix = 0; pix < npixels; ++pix) {
        char c = ' ';
        if (pixels[pix] > 0) {
            c = charset[pixels[pix] % (sizeof(charset) - 1)];
        }
        std::putchar(c);
        if (pix % width + 1 == width)
            std::puts("|");
    }

    printf("Time: %.6f sec.\n", omp_get_wtime() - start);
    for (int i = 0; i < nthreads; ++i)
        std::printf("Thread %d time: %.6f sec.\n", i, threadtime[i]);
    return 0;
}
