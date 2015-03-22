#include <iostream>
#include <deque>
#include <vector>
#include <cmath>
#include <thread>
#include <future>

std::mutex m;
std::deque<std::packaged_task<double()>> tasks;
bool stopflag = false;

void worker_thread() 
{
    while (!stopflag) {
        std::packaged_task<double()> task;
        {
            std::lock_guard<std::mutex> lock(m);
            if (tasks.empty())
                continue;
            task = std::move(tasks.front());
            tasks.pop_front();
        } 
        task();
    }
    std::cout << "Shutdown" << std::endl;
}

double task1(int x) { std::cout << "Task1\n"; return sqrt(x); }
double task2(int x) { std::cout << "Task2\n"; return static_cast<double>(x) * x; }
double shutdown_task(int dummy) { stopflag = true; return 0; }

template <typename Callable>
std::future<double> post_task(Callable callable) 
{
    std::packaged_task<double()> task(callable);
    std::future<double> f = task.get_future();
    std::lock_guard<std::mutex> lock(m);    
    tasks.push_back(std::move(task));
    return f;
}

int main() 
{
    std::thread worker(worker_thread);
    std::vector<std::future<double>> results;
    for (int i = 0; i < 10; ++i)
        results.push_back(post_task(std::bind((i % 2 ? task1 : task2), i)));
    post_task(std::bind(shutdown_task, 0));
    worker.join();
    for (int i = 0; i < 10; ++i)
        std::cout << "Result " << results[i].get() << "\n";
    return 0;
}
