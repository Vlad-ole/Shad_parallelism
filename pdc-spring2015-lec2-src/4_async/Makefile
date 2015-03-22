prog := async
prog_objs := async.o

CXX := g++
CXXFLAGS := -g -std=c++11 -Wall -O2
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

async.o: async.cpp

clean:
	@rm -rf *.o $(prog)
