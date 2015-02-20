#include <iostream>
#include <thread>

int main() 
{
    std::thread mythread([]() -> void {
        std::cout << "Hello, Multithreaded, World\n";
    });

    // Продолжаем вычисления в главном потоке 
    
    mythread.join();
    return 0;
}
