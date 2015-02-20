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

    // ѕродолжаем вычислени€ в главном потоке 
    t.join();

	system("pause");

    return 0;
}
