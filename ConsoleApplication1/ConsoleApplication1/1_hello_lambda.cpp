#include <iostream>
#include <thread>

int main() 
{
    std::thread mythread([]() -> void { std::cout << "Hello, Multithreaded, World\n"; });

    // ���������� ���������� � ������� ������ 
    
    mythread.join();
	system("pause");
    return 0;
}
