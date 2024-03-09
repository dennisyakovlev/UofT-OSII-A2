CC = g++
CC_FLAGS = -I. -ggdb3 -fsanitize=address -std=c99 -Wstrict-prototypes -Wall -Wshadow -Wextra -march=native

.PHONY: tests clean

all: main main2 tests

main: alloc.c main.c
	$(CC) $(CC_FLAGS) alloc.c main.c -o $@

main2: alloc.c main2.c
	$(CC) $(CC_FLAGS) alloc.c main2.c -o $@

tests: 
	cd tests; make

clean:
	rm *.out *.o main main2
