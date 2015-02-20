#include <iostream>
#include <thread>

class background_task {
public:
    void operator()() const
    {
        std::cout << "Hello, Multithreaded World!\n";
    }
};

int main() 
{
    background_task bgtask;
    
    // Передаем в конструктор функтор
    std::thread mythread(bgtask);
    
    // Продолжаем вычисления в главном потоке 
    
    mythread.join();

	system("pause");
    return 0;
}
