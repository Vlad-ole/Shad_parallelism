#include <iostream>
#include <thread>

class Account {
public:
	Account(int balance) : balance(balance) { }

	int getBalance() const { return balance; }

	void deposit(int amount) { balance += amount; }

	bool withdraw(int amount)
	{
		if (balance >= amount) {
			std::this_thread::sleep_for(std::chrono::milliseconds(1)); //
			balance -= amount;
			return true;
		}
		return false;
	}

private:
	int balance;
};

void client(int clientid, Account &account, int amount)
{
	std::printf("Client %d balance: %d\n", clientid, account.getBalance());
	bool result = account.withdraw(amount);
	if (result) {
		std::printf("Client %d withdraw %d OK\n", clientid, amount);
	}
	else {
		std::printf("Client %d withdraw %d FAILED\n", clientid, amount);
	}
	std::printf("Client %d balance: %d\n", clientid, account.getBalance());
}


int main(int argc, char *argv[])
{
	Account account(100);
	std::thread t1(client, 1, std::ref(account), 90);
	std::thread t2(client, 2, std::ref(account), 90);
	t1.join();
	t2.join();
	std::cout << "Account balance " << account.getBalance() << "\n";

	system("pause");

	return EXIT_SUCCESS;
}
