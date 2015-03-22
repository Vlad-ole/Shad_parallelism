#include <iostream>
#include <thread>
#include <atomic>

std::atomic<bool> stopflag;
int a, b;

void run()
{
	// Атомарное чтение stopflag + гарантия сохранения порядка выполнения операция
	while (!stopflag.load(/* memory_order = std::memory_order_seq_cst) */));
	b = a;
}

int main()
{
	stopflag.store(false);
	a = 0;
	b = 0;
	std::thread mythread(run);
	std::this_thread::sleep_for(std::chrono::milliseconds(100));

	a = 1;
	stopflag.store(true);
	mythread.join();

	system("pause");

	return 0;
}
