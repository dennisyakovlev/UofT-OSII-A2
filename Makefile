
CC_FLAGS = -I. -ggdb3 -fsanitize=address -std=c99 -Wstrict-prototypes -Wall -Wshadow -Wextra

all: alloc.c main2.c
	gcc $(CC_FLAGS) alloc.c main2.c

clean:
	rm *.out *.swp *.o
