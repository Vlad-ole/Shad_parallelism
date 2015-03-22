#include <future>
#include <thread>
#include <iostream>
#include <cmath>

void print_time(std::string const& msg = "")
{
    auto ts = std::chrono::system_clock::now();
    time_t tt = std::chrono::system_clock::to_time_t(ts);
    std::cout << msg << ": thread " << std::this_thread::get_id() << ": " 
              << ctime(&tt);
}

double square_root(double x) {
    if (x < 0)
        throw std::out_of_range("x < 0");
    return sqrt(x);
}

void background_thread(std::promise<double> promise, double x) 
{
    std::this_thread::sleep_for(std::chrono::seconds(3));
    try {
        promise.set_value(square_root(x)); // Если не вызвать set_value => exception std::future_error 
    } catch (std::exception&) {
        promise.set_exception(std::current_exception());
    }
    std::this_thread::sleep_for(std::chrono::seconds(3));
    // ...
}

int main() 
{
    std::promise<double> promise;  // Обещанный результат
    std::future<double> f = promise.get_future();
    print_time("Start thread");
    std::thread t(background_thread, std::move(promise), -1);
    print_time("Before get");
    try {
        std::cout << "Result " << f.get() << std::endl;  // Поток блокируется, пока второй поток не установит значение
    }
    catch (std::exception& e) {
        std::cout << "Exception: " << e.what() << "\n";
    }
    print_time("After get");
    t.join();
}
