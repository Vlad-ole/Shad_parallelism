#include <iostream>
#include <thread>

using namespace std;

struct func
{
	int &i;
	func(int &i_) : i(i_) {};
	void operator ()()
	{
		for (unsigned j = 0; j < 1E6; j++)
		{

		}
	}
};

int main()
{

	thread t([]{cout << "Hello, paraller World" << endl; });
	t.join();

	system("pause");
}