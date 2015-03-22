#include <iostream>

int main(int argc, char *argv[]) 
{
    #pragma omp parallel
    {
    std::cout << "Hello, OpenMP World!" << std::endl;
    }
    return 0;
}
