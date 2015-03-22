prog := pi_red
prog_objs := pi_red.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2 -fopenmp
LDFLAGS := -fopenmp -lm

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

pi_red.o: pi_red.cpp

clean:
	@rm -rf *.o $(prog)
