prog := hello
prog_objs := hello.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2 -fopenmp
LDFLAGS := -fopenmp

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

hello.o: hello.cpp

clean:
	@rm -rf *.o $(prog)
