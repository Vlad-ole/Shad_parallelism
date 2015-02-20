#include <iostream>
#include <thread>

void handler()
{
    for (int i = 0; i < 10; ++i) {
        std::cout << "Do something" << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

void spawn_thread()
{
    std::thread mythread(handler);  // Подсоединяемый поток (joinable)  
    std::this_thread::sleep_for(std::chrono::seconds(2));
    
    // Вызывается деструктор объекта mythread
    // Объект mythread подсоединяемый (joinable), деструктор вызывает std::terminate
}

int main() 
{
    spawn_thread();
    
    return 0; // Вызывается std::exit(0), завершаются все потоки процесса
}
