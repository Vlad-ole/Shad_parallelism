#include <iostream>
#include <cmath>
#include <thread>
#include <future>

void print_time(std::string const& msg = "")
{
    auto ts = std::chrono::system_clock::now();
    time_t tt = std::chrono::system_clock::to_time_t(ts);
    std::cout << msg << ": thread " << std::this_thread::get_id() << ": " 
              << ctime(&tt);
}

double mysqrt(int x)
{
    print_time("mysqrt task");
	return sqrt(x);
}

int main()
{
	std::packaged_task<double(int)> ptask(mysqrt); // Связывает callable с будущим результатом
	std::future<double> f = ptask.get_future();    
    print_time("Launch thread");
	std::thread t(std::move(ptask), 100);
    std::this_thread::sleep_for(std::chrono::seconds(4));
    print_time("Get future value");
	std::cout << "Value = " << f.get() << "\n";
	t.join();
    return 0;
}
