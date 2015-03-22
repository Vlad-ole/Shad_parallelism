#include <iostream>
#include <string>
#include <memory>
#include <thread>

//http://coliru.stacked-crooked.com/ work well

void fun(std::unique_ptr<std::string> sptr)
{
    std::cout << "1: *sptr = " << *sptr << "\n";
    std::cout << "1: sptr.get() = " << sptr.get() << "\n";
}

int main() 
{
    // ����������� s
    std::unique_ptr<std::string> sptr(new std::string("Big object"));
    std::cout << "0: sptr.get() = " << sptr.get() << "\n";
    std::thread t(fun, std::move(sptr));  // �������� �������� sptr ������
    std::cout << "0: sptr.get() = " << sptr.get() << "\n";
    t.join();
    return 0;
}
