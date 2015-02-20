#include <iostream>
#include <thread>

using namespace std;


int main()
{

	thread t([]{cout << "Hello, paraller World" << endl; });
	t.join();

	system("pause");
}