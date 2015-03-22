prog := promise
prog_objs := promise.o

CXX := g++
CXXFLAGS := -g -std=c++11 -Wall
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

promise.o: promise.cpp

clean:
	@rm -rf *.o $(prog)
