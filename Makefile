
CC_FLAGS = -I. -ggdb3 -fsanitize=address -std=c99 -Wstrict-prototypes -Wall -Wshadow -Wextra -march=native

all: main main2

main: alloc.c main.c
	gcc $(CC_FLAGS) alloc.c main.c -o $@

main2: alloc.c main.c
	gcc $(CC_FLAGS) alloc.c main2.c -o $@

clean:
	rm *.out *.o main main2
