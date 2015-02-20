#include <iostream>
#include <thread>

using namespace std;


void hello()
{
	cout << "Hello, paraller World" << endl;
}


int main()
{
	
	thread t(hello);
	t.join();

	system("pause");
}