prog := sections
prog_objs := sections.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2 -fopenmp
LDFLAGS := -fopenmp -lm

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

sections.o: sections.cpp

clean:
	@rm -rf *.o $(prog)
