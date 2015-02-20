#include <iostream>
#include <thread>

int main() 
{
    std::thread mythread([]() -> void { std::cout << "Hello, Multithreaded, World\n"; });

    // ѕродолжаем вычислени€ в главном потоке 
    
    mythread.join();
	system("pause");
    return 0;
}
