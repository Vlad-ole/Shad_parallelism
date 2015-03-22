prog := pi_spmd_for
prog_objs := pi_spmd_for.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2 -fopenmp
LDFLAGS := -fopenmp -lm

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

pi_spmd_for.o: pi_spmd_for.cpp

clean:
	@rm -rf *.o $(prog)
