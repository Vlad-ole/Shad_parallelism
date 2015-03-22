prog := condvar
prog_objs := condvar.o

CXX := g++
CXXFLAGS := -g -std=c++11 -Wall -O2
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

condvar.o: condvar.cpp

clean:
	@rm -rf *.o $(prog)
