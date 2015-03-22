#include <chrono>
#include <future>
#include <iostream>
#include <cmath>

void print_time(std::string const& msg = "")
{
    auto ts = std::chrono::system_clock::now();
    time_t tt = std::chrono::system_clock::to_time_t(ts);
    std::cout << msg << ": thread " << std::this_thread::get_id() << ": " 
              << ctime(&tt);
}

double square_root(double x) 
{
    print_time("Async started");
    if (x < 0)
        throw std::out_of_range("x < 0");
    return sqrt(x);
}

void do_other_stuff() 
{
    std::this_thread::sleep_for(std::chrono::seconds(4));
}

void async_test(std::launch policy)
{    
    print_time("Test started");
    std::future<double> f = std::async(policy, square_root, 10);
    do_other_stuff();
    std::cout << "Result: " << f.get() << std::endl;
}

int main()
{
    async_test(std::launch::async | std::launch::deferred); 
    async_test(std::launch::deferred);  // Launches async in current thread (lazy evaluation)
    async_test(std::launch::async);     // Launches async in a separate thread
    return 0;
}
