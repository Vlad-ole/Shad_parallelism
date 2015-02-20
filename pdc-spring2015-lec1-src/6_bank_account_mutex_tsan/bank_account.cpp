#include <iostream>
#include <thread>
#include <mutex>

class Account {
public:    
    Account(int balance): balance(balance) { }
    
    int getBalance() const 
    { 
        m.lock();
        int val = balance; 
        m.unlock();
        return val;
    }
    
    void deposit(int amount) 
    { 
        m.lock();
        balance += amount; 
        m.unlock();
    }

    bool withdraw(int amount) 
    {
        m.lock();
        if (balance >= amount) {
            balance -= amount;
            m.unlock();
            return true;
        }
        m.unlock();
        return false;
    }
    
private:
    int balance;
    mutable std::mutex m;
};

void client(int clientid, Account &account, int amount) 
{
    //std::printf("Client %d balance: %d\n", clientid, account.getBalance());
    bool result = account.withdraw(amount);
    if (result) {
        //std::printf("Client %d withdraw %d OK\n", clientid, amount);
    } else {
        //std::printf("Client %d withdraw %d FAILED\n", clientid, amount);
    }
    //std::printf("Client %d balance: %d\n", clientid, account.getBalance());
}

int main(int argc, char *argv[]) 
{
    Account account(100);
    std::thread t1(client, 1, std::ref(account), 90);
    std::thread t2(client, 2, std::ref(account), 90);
    t1.join();
    t2.join();
    std::cout << "Account balance " << account.getBalance() << "\n";
    return EXIT_SUCCESS;
}
