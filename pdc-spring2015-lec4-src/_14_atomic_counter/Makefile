prog := prog
prog_objs := prog.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -g -O2 -fopenmp --save-temps
LDFLAGS := -fopenmp -lm

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

prog.o: prog.cpp

clean:
	@rm -rf *.o $(prog)
