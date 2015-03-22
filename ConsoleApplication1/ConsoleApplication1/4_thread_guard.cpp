#include <iostream>
#include <thread>

class thread_guard {
public:
	thread_guard(std::thread& thread) : thread_(thread) {}

	~thread_guard()
	{
		std::cout << "thread_guard dtor\n";
		if (thread_.joinable()) {
			thread_.join();
		}
	}

	thread_guard(const thread_guard&) = delete;
	thread_guard& operator=(const thread_guard&) = delete;

private:
	std::thread& thread_;
};

void handler()
{
	for (int i = 0; i < 3; i++) {
		std::this_thread::sleep_for(std::chrono::seconds(1));
	}
}

void do_something()
{
	// Например, пытаемся читать несуществующий файл 
	throw "Exception";
}

void spawn_thread()
{
	std::thread t(handler);
	thread_guard g(t);
	do_something(); // Генерирует исключение
	//t.join();
}

int main()
{
	try {
		spawn_thread();
	}
	catch (...) {
		std::cout << "Exception\n";
	}
	return 0;
}
