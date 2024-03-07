


all: alloc.c main2.c
	gcc -I. -ggdb3 -fsanitize=address -std=c11  -Wall -Wshadow -Wextra alloc.c main2.c

clean:
	rm *.out *.swp *.o