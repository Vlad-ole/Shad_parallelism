#include <iostream>
#include <thread>

void hello()
{
    std::cout << "Hello, Multithreaded World!\n";
    std::this_thread::sleep_for(std::chrono::seconds(5));
}

int main() 
{
    // —оздаем и запускаем новый поток выполнени€
    std::thread mythread(hello);
    
    // ѕродолжаем вычислени€ в главном потоке 

    // ƒожидаемс€ завершени€ потока mythread
    mythread.join();
    return 0;
}