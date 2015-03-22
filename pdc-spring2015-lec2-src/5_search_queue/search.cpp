#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <queue>
#include <chrono>
#include <thread>
#include <future>

template <typename T> class threadsafe_queue {
public:
    T take() 
    {
        std::unique_lock<std::mutex> ulock(mutex);
        while (queue.empty())
            cond.wait(ulock);
        T val = queue.front();
        queue.pop();
        return val;
    }
    
    void put(T val) 
    {
        std::lock_guard<std::mutex> lock(mutex);
        queue.push(val);
        cond.notify_one();
    }

private:
    std::queue<T> queue;
    std::mutex mutex;
    std::condition_variable cond;
};

std::vector<int> search(const std::string& needle, threadsafe_queue<std::string>& queue)
{
    std::vector<int> results;
    std::string str;
    while ((str = queue.take()) != "_STOP_") {
        std::transform(str.begin(), str.end(), str.begin(), ::tolower);
        if (str.find(needle) != std::string::npos)
            results.push_back(0);
    }
    return results;
}

int main(int argc, char **argv)
{
    std::chrono::high_resolution_clock::time_point start, end;
    int totaltime;
    threadsafe_queue<std::string> queue;

    // Launch threads N - 1 for serach, master thread - read
    start = std::chrono::high_resolution_clock::now(); 
	std::string needle = argc > 2 ? argv[2] : "concurrent";
    int nthreads = std::thread::hardware_concurrency();
    if (argc > 3)
        nthreads = atoi(argv[3]);
    std::vector<std::future<std::vector<int>>> futures; 
    for (int i = 1; i < nthreads; ++i)
        futures.push_back(std::async(std::launch::async, search, needle, std::ref(queue)));
    
    // Read file into queue
    std::ifstream fs(argc > 1 ? argv[1] : "test.xml");
    for (std::string line; std::getline(fs, line); )
        queue.put(line);
    // Put terminate commands into the queue
    for (int i = 1; i < nthreads; ++i)
        queue.put("_STOP_");
    
    int count = 0;
    for (int i = 0; i < nthreads - 1; ++i)
        count += futures.at(i).get().size();
    end = std::chrono::high_resolution_clock::now(); 
	totaltime = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
        
	std::cout << "Threads: " << nthreads << std::endl;
	std::cout << "Total time: " << totaltime << " ms" << std::endl;
	std::cout << "Found " << count << " matches for '" << needle << "'" << std::endl;
	return 0;
}
