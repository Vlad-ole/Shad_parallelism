prog := jacobi
prog_objs := jacobi.o

CC := mpicc
CFLAGS := -std=c99 -Wall -O2
LDFLAGS := -lm

.PHONY: all clean

all: $(prog)

$(prog): $(prog_objs)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

jacobi.o: jacobi.c

clean:
	@rm -rf *.o $(prog)
