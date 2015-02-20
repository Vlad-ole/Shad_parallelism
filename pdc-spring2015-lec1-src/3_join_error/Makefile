prog := join_error
prog_objs := join_error.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

join_error.o: join_error.cpp

clean:
	@rm -rf *.o $(prog)
