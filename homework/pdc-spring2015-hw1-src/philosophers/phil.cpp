//
// phil.cpp: Dining philosophers problem
//
#include <algorithm>
#include <cstdlib>
#include <string>
#include <limits>
#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <atomic>

unsigned int debugflag = 0;

// Philosopher stat
struct philosopher_stat {
    int eat_count;
    int wait_time;
    philosopher_stat(): eat_count(0), wait_time(0) {}
};

// Fork
class fork {
public:
    fork(): mutex_() {};

    void take()
    {
        mutex_.lock();
    }

    void put()
    {
        mutex_.unlock();
    }
    
private:
    std::mutex mutex_;
};

// Philosopher
class philosopher {
public:
    philosopher(unsigned int id, fork* leftfork, fork* rightfork, int nphils, unsigned int think_delay_max, 
                unsigned int eat_delay_max, philosopher_stat* philstat): 
        id(id), leftfork(leftfork), rightfork(rightfork), nphils(nphils), think_delay_max(think_delay_max), 
        eat_delay_max(eat_delay_max), stopflag(false), philstat(philstat) 
    {
    }

    void run()
    {
        while (!stopflag) {
            think();
            leftfork->take();
            if (debugflag) std::printf("[%2d] took left fork\n", id);
            rightfork->take();
            if (debugflag) std::printf("[%2d] took right fork\n", id);
            eat();
            rightfork->put();
            if (debugflag) std::printf("[%2d] put right fork\n", id);
            leftfork->put();
            if (debugflag) std::printf("[%2d] put left fork\n", id);
        }
    }

    void stop() 
    {
        stopflag = true;
    }

    void print_stats() 
    {
        std::printf("[%2d] %d %d\n", id, philstat->eat_count, philstat->wait_time);
    }
    
private:
    unsigned int id;
    fork* leftfork;
    fork* rightfork;
    unsigned int nphils;
    unsigned int think_delay_max;
    unsigned int eat_delay_max;
    std::chrono::high_resolution_clock::time_point wait_start;
    std::atomic<bool> stopflag;
    philosopher_stat* philstat;

    void think() 
    {
        if (debugflag) std::printf("[%d] thinking\n", id);
        sleep_rand(think_delay_max);
        if (debugflag) std::printf("[%d] hungry\n", id);
        wait_start = std::chrono::high_resolution_clock::now();
    }

    void eat() 
    {
        philstat->wait_time += std::chrono::duration_cast<std::chrono::milliseconds>
                               (std::chrono::high_resolution_clock::now() - wait_start).count();
        if (debugflag) std::printf("[%d] eating\n", id);
        sleep_rand(eat_delay_max);
        philstat->eat_count++;
    }

    void sleep_rand(int maxdelay)
    {
        // Sleep for [0, maxdelay] milliseconds
        std::this_thread::sleep_for(std::chrono::milliseconds(rand() % (maxdelay + 1)));
    }
};

void print_total_stats(philosopher_stat** philstats, int nphils)
{
    double eat_avg = 0.0, wait_avg = 0.0;
    double eat_sum = 0.0, eat_sum_sqr = 0.0;
    int eat_min, eat_max;
    
    eat_min = std::numeric_limits<int>::max();
    eat_max = 0;
    for (int i = 0; i < nphils; ++i) {
        eat_sum += philstats[i]->eat_count;
        eat_sum_sqr += pow(philstats[i]->eat_count, 2.0); 
        wait_avg += philstats[i]->wait_time;
        if (philstats[i]->eat_count < eat_min)
            eat_min = philstats[i]->eat_count;
        if (philstats[i]->eat_count > eat_max)
            eat_max = philstats[i]->eat_count;
    }
    eat_avg = eat_sum / nphils;
    wait_avg /= nphils;
    // Jain's fairness index for eat_sum
    double jains_idx = pow(eat_sum, 2.0) / (nphils * eat_sum_sqr); 
    
    std::printf("Total stats: eat_avg=%.2f; wait_avg=%.2f; min/max=%.2f; jains=%.4f\n", 
                eat_avg, wait_avg, (double)eat_min / (double)eat_max, jains_idx);    
}

int main(int argc, char* argv[]) 
{
    if (argc != 6) {
        std::cout << "Usage: " << argv[0] << " <nphils> <duration> <think_delay_max> <eat_delay_max> <debugflag>\n";
        return EXIT_FAILURE;
    }

    unsigned int nphils = atoi(argv[1]);
    unsigned int duration = atoi(argv[2]);
    unsigned int think_delay_max = atoi(argv[3]);
    unsigned int eat_delay_max = atoi(argv[4]);
    debugflag = atoi(argv[5]);
        
    // Disable buffering for stdout
    setbuf(stdout, NULL);
    srand((unsigned int)time(0));
    
    philosopher_stat* philstats[nphils];
    for (unsigned int i = 0; i < nphils; ++i)
        philstats[i] = new philosopher_stat();
    
    fork* forks[nphils];
    for (unsigned int i = 0; i < nphils; ++i)
        forks[i] = new fork();
    
    philosopher* phils[nphils];
    for (unsigned int i = 0; i < nphils; ++i) {
        phils[i] = new philosopher(i + 1, forks[i], forks[(i + 1) % nphils], 
                                   nphils, think_delay_max, eat_delay_max, philstats[i]);
    }

    std::thread threads[nphils];
    for (unsigned int i = 0; i < nphils; ++i)
        threads[i] = std::thread(&philosopher::run, phils[i]);
    // Now we have nphils threads + master thread

    std::this_thread::sleep_for(std::chrono::seconds(duration));
    std::for_each(phils, phils + nphils, std::mem_fn(&philosopher::stop));
    std::for_each(threads, threads + nphils, std::mem_fn(&std::thread::join));

    std::printf("Dining philosophers problem\n");
    std::printf("nphils = %d, duration = %d, think_delay_max = %d, eat_delay_max = %d, debugflag = %d\n",
                nphils, duration, think_delay_max, eat_delay_max, debugflag);
    std::printf("[TID] <eat_count> <wait_time>\n");
    std::for_each(phils, phils + nphils, std::mem_fn(&philosopher::print_stats));
    
    print_total_stats(philstats, nphils);
    
    for (unsigned int i = 0; i < nphils; ++i) {
        delete phils[i];
        delete forks[i];
        delete philstats[i];
    }
    return 0;
}
