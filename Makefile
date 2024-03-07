


all: alloc.c main2.c
	gcc -I. -ggdb3 -fsanitize=address -std=c99 -Wstrict-prototypes -Wall -Wshadow -Wextra alloc.c main2.c

clean:
	rm *.out *.swp *.o
