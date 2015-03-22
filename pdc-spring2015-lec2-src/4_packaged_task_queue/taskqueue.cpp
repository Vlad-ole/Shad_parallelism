#include <iostream>
#include <deque>
#include <cmath>
#include <thread>
#include <future>

std::mutex m;
std::deque<std::packaged_task<void()>> tasks;
bool stopflag = false;

void worker_thread() 
{
    while (!stopflag) {
        std::packaged_task<void()> task;
        {
            std::lock_guard<std::mutex> lock(m);
            if (tasks.empty())
                continue;
            task = std::move(tasks.front()); // Извлекаем задачу из очереди
            tasks.pop_front();
        } 
        task(); // Выполняем задачу в текущем потоке
    }
    std::cout << "Shutdown" << std::endl;
}

void task1() { std::cout << "Task1\n"; }
void task2() { std::cout << "Task2\n"; }
void shutdown_task() { stopflag = true; }

template <typename Callable> 
std::future<void> post_task(Callable callable) 
{
    std::packaged_task<void()> task(callable);
    std::future<void> f = task.get_future();
    std::lock_guard<std::mutex> lock(m); // Помещаем задачу в конец двусторонней очереди
    tasks.push_back(std::move(task));
    return f;
}

int main() 
{
    std::thread worker(worker_thread);
    for (int i = 0; i < 10; i++)
        post_task(((i % 2 == 0) ? task1 : task2));
    post_task(shutdown_task);
    worker.join();
    return 0;
}
