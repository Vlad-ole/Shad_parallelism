#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <chrono>

int main(int argc, char **argv)
{
    std::chrono::high_resolution_clock::time_point start, end;
    int dur, totaltime;
        
    // Read file
    start = std::chrono::high_resolution_clock::now(); 
    std::ifstream fs(argc > 1 ? argv[1] : "test.xml");
    std::string needle = argc > 2 ? argv[2] : "concurrent";
    std::vector<std::string> lines;
	for (std::string line; std::getline(fs, line); ) {
		lines.push_back(line);
	}
    end = std::chrono::high_resolution_clock::now(); 
	totaltime = dur = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
	std::cout << "Read time: " << dur << " ms" << std::endl;

    // Search
    start = std::chrono::high_resolution_clock::now(); 
	std::vector<int> results;
	for (size_t i = 0; i < lines.size(); ++i) {
		std::transform(lines[i].begin(), lines[i].end(), lines[i].begin(), ::tolower);
		if (lines[i].find(needle) != std::string::npos)
			results.push_back(i);
	}
    end = std::chrono::high_resolution_clock::now(); 
	dur = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
	totaltime += dur;
	std::cout << "Search time: " << dur << " ms" << std::endl;
	std::cout << "Total time: " << totaltime << " ms" << std::endl;
	std::cout << "Found " << results.size() << " matches for '" << needle << "'" << std::endl;
	return 0;
}
