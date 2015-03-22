#include <cstdio>
#include <cstdlib>

int main(int argc, char **argv)
{
    double counter = 0;
    
    #pragma omp parallel for
    for (int i = 0; i < 1000; i++) {
        #pragma omp atomic
        counter += static_cast<double>(i);
    }    
    printf("counter = %.2f\n", counter);    
}
