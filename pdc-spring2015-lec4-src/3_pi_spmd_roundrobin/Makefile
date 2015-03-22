prog := pi_spmd
prog_objs := pi_spmd.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2 -fopenmp
LDFLAGS := -fopenmp -lm

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

pi_spmd.o: pi_spmd.cpp

clean:
	@rm -rf *.o $(prog)
