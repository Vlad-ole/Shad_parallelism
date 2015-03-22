#include <iostream>
#include <queue>
#include <thread>
#include <condition_variable>

std::queue<int> data_queue;
std::mutex data_mutex;
std::condition_variable data_condvar;
std::mutex cout_mutex;

void producer()
{
    for (int i = 0; i < 10; ++i) {
        std::lock_guard<std::mutex> lg(data_mutex);  // Защищаем доступ к очереди
        int val = (i < 9) ? i + 1 : -1; 
        data_queue.push(val);
        data_condvar.notify_one(); // Извещаем заблокированный поток о новых данных 
    }
    
}

void consumer()
{
    while (true) {
        std::unique_lock<std::mutex> lock(data_mutex); // Защищаем доступ к очереди
        // Wait:
        // Проверяем условие - если не выполнено, освобождаем lock и ожидаем извещения
        // Получили извещение - захватываем lock и проверяем условие
        // Условие выполнено - захватываем lock и выходим из wait
        data_condvar.wait(lock, []{ return !data_queue.empty(); });
        int val = data_queue.front();
        data_queue.pop();
        lock.unlock();
        std::cout << "Consumer " << val << "\n";
        if (val == -1)
            break;
    }
}

int main()
{
    std::thread c(consumer);
    //std::thread p(producer);
    //p.join();
    producer();
    c.join();
    return 0;
}
