#include <iostream>
#include <thread>

void handler()
{
    for (int i = 0; i < 3; i++) {
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

void do_something()
{
    // Например, пытаемся читать несуществующий файл 
    throw "Exception";
}

void spawn_thread()
{
    std::thread t(handler);    
    do_something();
    // При исключительной ситуации поток управления сюда не попадает
    // Вызывается деструкторы автоматических объектов, включая t => error
    t.join();
}

int main() 
{
    try { 
        spawn_thread(); 
    } catch (...) { 
        std::cout << "Unknown exception\n"; 
    }
    return 0;
}
