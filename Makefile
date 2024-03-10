CC = g++
CC_FLAGS = -I. -ggdb3 -fsanitize=address -std=c99 -Wstrict-prototypes -Wall -Wshadow -Wextra -march=native
OBJ_DEPS = alloc.o hashtable.o

.PHONY: tests clean

all: main main2

main: $(OBJ_DEPS) main.c
	$(CC) $(CC_FLAGS) $^ -o $@

main2: $(OBJ_DEPS) main2.c
	$(CC) $(CC_FLAGS) $^ -o $@

tests: 
	cd tests; make

%.o: %.c %.h
	$(CC) $(CC_FLAGS) -c $<

clean:
	rm *.out *.o main main2
