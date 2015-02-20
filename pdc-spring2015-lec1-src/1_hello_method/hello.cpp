#include <iostream>
#include <thread>

class bgtask {
public:
    void run() const
    {
        std::cout << "Run\n";
    }
};

int main() 
{
    bgtask task;
    std::thread t(&bgtask::run, &task);

    // Продолжаем вычисления в главном потоке 
    t.join();
    return 0;
}
