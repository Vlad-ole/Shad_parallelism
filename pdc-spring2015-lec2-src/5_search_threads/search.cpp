#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <chrono>
#include <thread>
#include <future>

std::vector<int> search(const std::string& needle, const std::vector<std::string>& lines, 
                        int from, int to)
{
    //std::printf("Thread %d [%d, %d]\n", std::this_thread::get_id(), from, to);
    std::vector<int> results;
    for (int i = from; i < to; ++i) {
        std::string str = lines[i];
        std::transform(str.begin(), str.end(), str.begin(), ::tolower);
        if (str.find(needle) != std::string::npos)
            results.push_back(i);
    }
    return results;
}

int main(int argc, char **argv)
{
    std::chrono::high_resolution_clock::time_point start, end;
    int readtime, searchtime;
        
    // Read file into memory
    start = std::chrono::high_resolution_clock::now(); 
    std::ifstream fs(argc > 1 ? argv[1] : "test.xml");
	std::string needle = argc > 2 ? argv[2] : "concurrent";
	std::vector<std::string> lines;
	for (std::string line; std::getline(fs, line); )
		lines.push_back(line);
    end = std::chrono::high_resolution_clock::now(); 
	readtime = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();

    // Search in multiple threads
    start = std::chrono::high_resolution_clock::now(); 
    int nthreads = std::thread::hardware_concurrency();
    if (argc > 3)
        nthreads = atoi(argv[3]);
    int lines_per_thread = lines.size() / nthreads;
    std::vector<std::future<std::vector<int>>> futures; 
    for (int i = 1; i < nthreads; ++i) {
        int from = i * lines_per_thread;
        int to = (i != nthreads - 1) ? from + lines_per_thread - 1 : lines.size() - 1;         
        futures.push_back(std::async(std::launch::async, search, needle, std::ref(lines), from, to));
    } 
    std::vector<int> result = search(needle, std::ref(lines), 0, lines_per_thread - 1);
    
    int count = result.size();
    for (int i = 0; i < nthreads - 1; ++i)
        count += futures.at(i).get().size();
    end = std::chrono::high_resolution_clock::now(); 
	searchtime = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
        
    std::cout << "Lines: " << lines.size() << std::endl;
    std::cout << "Lines per thread: " << lines_per_thread << std::endl;
	std::cout << "Threads: " << nthreads << std::endl;
	std::cout << "Read time: " << readtime << " ms" << std::endl;
	std::cout << "Search time: " << searchtime << " ms" << std::endl;
	std::cout << "Total time: " << readtime + searchtime << " ms" << std::endl;
	std::cout << "Found " << count << " matches for '" << needle << "'" << std::endl;
	return 0;
}
