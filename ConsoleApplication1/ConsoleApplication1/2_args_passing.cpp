#include <iostream>
#include <string>
#include <memory>
#include <thread>

void fun(int i, std::string const& s)
{
    std::cout << "1: i = " << i << "; s = " << s << "\n";
}

int main() 
{
    const char *s = "Hello";
    int i = 3;
    std::thread t(fun, i, s);  // Поток вызывает fun(i, s)
    t.join();

	system("pause");
    return 0;
}
