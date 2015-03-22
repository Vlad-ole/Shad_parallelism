#include <iostream>
#include <thread>

volatile bool stopflag;
int a, b;

void run()
{
	while (!stopflag);
	// Здесь нужен барьер, чтобы чтение stopflag всегда предшествовало обновлению b
	b = a;
}

int main()
{
	stopflag = false;
	a = b = 0;
	std::thread mythread(run);
	std::this_thread::sleep_for(std::chrono::milliseconds(100));

	a = 1;
	// Здесь нужен барьер, чтобы a была видна всем потокам, перед обновлением stopflag
	stopflag = true;

	mythread.join();

	system("pause");

	return 0;
}
