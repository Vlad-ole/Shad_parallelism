#include <iostream>
#include <vector>
#include <algorithm>
#include <thread>
#include <atomic>

class barrier {
    unsigned int const count;
    std::atomic<unsigned int> spaces;
    std::atomic<unsigned int> generation;

public:
    explicit barrier(unsigned nthreads): count(nthreads), spaces(nthreads), generation(0) { }
    
    void wait() {
        unsigned const my_generation = generation;
        if (--spaces == 0) {
            // Only last thread execute this code
            std::cout << "Thread " << std::this_thread::get_id() << ": gen = " << my_generation 
                      << " if spaces = " << spaces << "\n";
            spaces = count;
            ++generation;  // Notify all thread to stop waiting 
        } else {
            std::cout << "Thread " << std::this_thread::get_id() << ": gen = " << my_generation 
                      << " spaces = " << spaces << "\n";
            while (generation == my_generation)
                std::this_thread::yield();
        }
    }
};

void print_time(std::string const& msg = "")
{
    auto ts = std::chrono::system_clock::now();
    time_t tt = std::chrono::system_clock::to_time_t(ts);
    std::cout << "Thread " << std::this_thread::get_id() << ": " << msg << ": " 
              << ctime(&tt);
}

void handler(int id, int n, barrier& b)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(rand() % 5000));
    print_time("Before barrier");
    b.wait();
    print_time("After barrier");
}

int main()
{
    std::vector<std::thread> threads(4);
    barrier b(threads.size());
    
    for (size_t i = 0; i < threads.size(); ++i) {
        threads[i] = std::thread(handler, i, threads.size(), std::ref(b));
    }     
    
    std::for_each(threads.begin(), threads.end(), 
                  std::mem_fn(&std::thread::join));
    return 0;
}
