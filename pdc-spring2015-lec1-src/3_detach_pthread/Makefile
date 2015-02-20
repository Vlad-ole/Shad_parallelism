prog := detach
prog_objs := detach.o

CXX := g++
CXXFLAGS := -std=c++11 -Wall -O2
LDFLAGS := -pthread

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

detach.o: detach.cpp

clean:
	@rm -rf *.o $(prog)
