#include <iostream>
#include <thread>

void handler(int& counter)
{
	for (int i = 0; i < 1000; ++i)
	{
		counter++; // Data race!!!
		std::this_thread::sleep_for(std::chrono::milliseconds(10));
	}
}

int main()
{
	int counter = 0;
	std::thread t1(handler, std::ref(counter));
	std::thread t2(handler, std::ref(counter));
	t1.join();
	t2.join();
	std::cout << "Counter = " << counter << std::endl;

	system("pause");

	return 0;
}