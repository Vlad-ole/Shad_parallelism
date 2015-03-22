#include <iostream>
#include <thread>

void handler()
{
	for (int i = 0; i < 10; ++i) {
		std::cout << "Do something" << std::endl;
		std::this_thread::sleep_for(std::chrono::seconds(1));
	}
}

void spawn_thread()
{
	std::thread mythread(handler);  // �������������� ����� (joinable)  
	std::this_thread::sleep_for(std::chrono::seconds(2));

	// ���������� ���������� ������� mythread
	// ������ mythread �������������� (joinable), ���������� �������� std::terminate
}

int main()
{
	spawn_thread();

	return 0; // ���������� std::exit(0), ����������� ��� ������ ��������
}
