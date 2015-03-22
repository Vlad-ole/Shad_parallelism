#include <iostream>
#include <queue>
#include <thread>
#include <condition_variable>

template <typename T> class ringbuffer {
public:
    ringbuffer(int capacity): capacity(capacity), head(0), tail(0), count(0) 
    {
        buffer = new T[capacity];
    } 
    
    ~ringbuffer()
    {
        delete[] buffer;
    }
    
    void put(T value) 
    {
        std::unique_lock<std::mutex> ulock(mutex, std::defer_lock);
        // Wait for free positions in the buffer
        while (true) {
            ulock.lock();
            if (count != capacity) {
                buffer[tail] = value;
                tail = (tail + 1) % capacity;
                ++count;
                break;
            }
            ulock.unlock();
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
        }
    }

    T take() 
    {
        std::unique_lock<std::mutex> ulock(mutex, std::defer_lock);
        // Wait for elems in the buffer
        while (true) {
            ulock.lock();
            if (count != 0) {
                T value = buffer[head];
                head = (head + 1) % capacity;
                --count;
                return value;
            }
            ulock.unlock();
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
        }
    }
    
private:
    T* buffer;
    int capacity;
    int head;
    int tail;
    int count;   
    std::mutex mutex;
};

template <typename T>
void producer(int id, ringbuffer<T>& buf)
{
    for (size_t i = 0; i < 15; ++i) {
        buf.put(id + 100 + i);
        std::cout << "Producer " << id << " put " << id + 100 + i << "\n";    
    }
}

template <typename T>
void consumer(int id, ringbuffer<T>& buf)
{
    for (size_t i = 0; i < 10; ++i) {
        T val = buf.take();
        std::cout << "Consumer " << id << " take " << val << "\n";    
    }
}

int main()
{
    ringbuffer<int> buffer(100);

    int nconsumers = 3;
    std::vector<std::thread> consumers;
    for (int i = 0; i < nconsumers; ++i)
        consumers.push_back(std::thread(consumer<int>, i, std::ref(buffer)));

    int nproducers = 2;
    std::vector<std::thread> producers;
    for (int i = 0; i < nproducers; ++i)
        producers.push_back(std::thread(producer<int>, i, std::ref(buffer)));

    for (std::thread& t : consumers)
        t.join();
    for (std::thread& t : producers)
        t.join();
    return 0;
}
