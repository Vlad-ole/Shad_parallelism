#include <iostream>
#include <thread>

volatile bool stopflag;
int a, b;

void run()
{
	while (!stopflag);
	// ����� ����� ������, ����� ������ stopflag ������ �������������� ���������� b
	b = a;
}

int main()
{
	stopflag = false;
	a = b = 0;
	std::thread mythread(run);
	std::this_thread::sleep_for(std::chrono::milliseconds(100));

	a = 1;
	// ����� ����� ������, ����� a ���� ����� ���� �������, ����� ����������� stopflag
	stopflag = true;

	mythread.join();

	system("pause");

	return 0;
}
