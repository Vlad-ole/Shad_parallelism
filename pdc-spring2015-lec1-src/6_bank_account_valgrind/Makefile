prog := bank_account
prog_objs := bank_account.o

CXX := g++
CXXFLAGS := -g -std=c++11 -Wall
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

bank_account.o: bank_account.cpp

clean:
	@rm -rf *.o $(prog)
