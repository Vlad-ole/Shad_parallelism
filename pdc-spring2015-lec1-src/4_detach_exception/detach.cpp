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
    throw "Exception";
}

void spawn_thread()
{
    std::thread t(handler);    
    try { do_something(); }
    catch (...) {
        t.join();
        throw;
    }
    t.join();
}

int main() 
{
    try {
        spawn_thread();
    }
    catch (...) { std::cout << "Exception\n"; }
    return 0;
}
