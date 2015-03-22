#include <iostream>
#include <thread>

void handler()
{
	for (int i = 0; i < 10; ++i) {
		std::cout << "Do something" << std::endl;
		std::this_thread::sleep_for(std::chrono::seconds(1));
	}
}

void spawn_thread_detached()
{
	std::thread mythread(handler);  // �������������� ����� (joinable)  
	mythread.detach(); // ����������� �����
	std::this_thread::sleep_for(std::chrono::seconds(2));

	// ���������� ���������� ������� mythread
}

int main()
{
	spawn_thread_detached();

	return 0; // ���������� std::exit(0), ����������� ��� ������ ��������
}
