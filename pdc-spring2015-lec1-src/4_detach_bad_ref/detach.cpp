#include <iostream>
#include <thread>

class handler {
public:
    handler(int& state): state_(state) {} 
    void operator()() const 
    {
        for (int i = 0; i < 5; ++i) {
            std::cout << "State = " << state_ << "\n";
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }
    }
    
private:
    int& state_;
};

void run()
{
    int i = 33;
    handler h(i);
    std::thread t(h);    
    t.detach();
    // Объект i разрушается, поток t может все еще его использовать!
}

int main() 
{
    run();
    std::this_thread::sleep_for(std::chrono::seconds(2));
    return 0;
}
