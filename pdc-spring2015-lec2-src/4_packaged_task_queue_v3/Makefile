prog := taskqueue
prog_objs := taskqueue.o

CXX := g++
CXXFLAGS := -g -std=c++11 -Wall
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

taskqueue.o: taskqueue.cpp

clean:
	@rm -rf *.o $(prog)
