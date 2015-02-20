#include <iostream>
#include <thread>
#include <mutex>

class Account {
public:    
    Account(int balance): balance(balance) { }
    
    int getBalance() const { return balance; }
    
    void deposit(int amount) { balance += amount; }

    bool withdraw(int amount) 
    {
        if (balance >= amount) {
            balance -= amount;
            return true;
        }
        return false;
    }
    
    std::unique_lock<std::mutex> getDeferLock() 
    {
        std::unique_lock<std::mutex> lock(m, std::defer_lock);
        return lock;
    }

private:
    int balance;
    std::mutex m;
};

void transfer(int clientid, Account& from, Account& to, int amount)
{
    if (from.withdraw(amount)) {
        std::printf("Client %d withdraw %d OK\n", clientid, amount);
        to.deposit(amount);
        std::printf("Client %d deposit %d OK\n", clientid, amount);
    } else {
        std::printf("Client %d withdraw %d ERROR\n", clientid, amount);
    }
}

void client(int clientid, Account& from, Account& to, int amount)
{
    bool success = false;
    std::unique_lock<std::mutex> lock_from(from.getDeferLock());
    std::unique_lock<std::mutex> lock_to(to.getDeferLock());
    while (true) {
        if (lock_from.try_lock()) {
            if (lock_to.try_lock()) {
                transfer(clientid, from, to, amount);
                lock_to.unlock();
                success = true;
            }
            lock_from.unlock();
        }
        if (success)
            break;
        std::this_thread::sleep_for(std::chrono::milliseconds(rand() % 100));    
    }
}

int main(int argc, char *argv[]) 
{
    Account a(100);
    Account b(100);
    std::thread t1(client, 1, std::ref(a), std::ref(b), 10);
    std::thread t2(client, 2, std::ref(b), std::ref(a), 20);
    t1.join();
    t2.join();

    // Assert: a=110, b=90
    std::cout << "A balance: " << a.getBalance() << "\n";
    std::cout << "B balance: " << b.getBalance() << "\n";
    return EXIT_SUCCESS;
}

