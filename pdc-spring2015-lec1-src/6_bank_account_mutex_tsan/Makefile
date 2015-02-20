prog := bank_account
prog_objs := bank_account.o

CXX := g++
CXXFLAGS := -g -O2 -std=c++11 -Wall -fsanitize=thread -fPIE
LDFLAGS := -pthread -fsanitize=thread -pie

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

bank_account.o: bank_account.cpp

clean:
	@rm -rf *.o $(prog)
