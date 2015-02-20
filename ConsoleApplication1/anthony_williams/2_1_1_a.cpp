#include <iostream>
#include <thread>

using namespace std;

class background_task
{
public:
	
	void operator() () const
	{
		cout << "Hello, paraller World" << endl;
	}
};


int main()
{
	//background_task f; // var 1
	//thread t(f);
	
	//thread t(background_task()); // wrong (this is function)

	//thread t( (background_task()) ); // var 2

	thread t{ background_task() }; // var 3
	
	t.join();

	system("pause");
}