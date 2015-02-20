#include <iostream>
#include <thread>

void hello()
{
    std::cout << "Hello, Multithreaded World!\n";
    std::this_thread::sleep_for(std::chrono::seconds(30));
}

int main() 
{
    // Создаем и запускаем новый поток выполнения
    std::thread mythread{hello};
    
    // Продолжаем вычисления в главном потоке 

    // Дожидаемся завершения потока mythread
    mythread.join();
    return 0;
}
