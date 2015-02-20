#include <iostream>
#include <thread>

void handler()
{
    for (int i = 0; i < 10; ++i) {
        std::cout << "Do something" << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

void spawn_thread_detached()
{
    std::thread mythread(handler);  // Подсоединяемый поток (joinable)  
    mythread.detach(); // Отсоеденили поток
    std::this_thread::sleep_for(std::chrono::seconds(2));
    
    // Вызывается деструктор объекта mythread
}

int main() 
{
    spawn_thread_detached();
    
    return 0; // Вызывается std::exit(0), завершаются все потоки процесса
}
