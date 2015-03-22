#include <iostream>
#include <thread>

int lock = 0;

void handler(int& counter)
{
	for (int i = 0; i <10000; ++i){
		while (test_and_set(&lock) == 1) // Ожидаем освобождение блокировки
			;
		counter++;
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