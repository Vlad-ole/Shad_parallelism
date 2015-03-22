#include <iostream>
#include <thread>

void hello()
{
    std::cout << "Hello, Multithreaded World!\n";
    std::this_thread::sleep_for(std::chrono::seconds(5));
}

int main() 
{
    // ������� � ��������� ����� ����� ����������
    std::thread mythread(hello);
    
    // ���������� ���������� � ������� ������ 

    // ���������� ���������� ������ mythread
    mythread.join();
    return 0;
}