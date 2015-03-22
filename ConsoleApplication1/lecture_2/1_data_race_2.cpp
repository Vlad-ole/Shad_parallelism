#include <iostream>
#include <thread>

int lock = 0;

void handler(int& counter)
{
	for (int i = 0; i < 10000; ++i)
	{
		do{ // Ожидаем освобождение блокировки
			if (lock == 0)
			{
				lock = 1; // Захватываем блокировку
				break;
			}
		} while (1);

		counter++;
		std::this_thread::sleep_for(std::chrono::milliseconds(10));

		lock = 0; // Освобождаем блокировку
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