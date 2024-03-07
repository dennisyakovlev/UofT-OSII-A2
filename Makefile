

all: alloc.c main2.c
	gcc -I. -ggdb3 -fsanitize=address alloc.c main2.c

clean:
	rm *.out *.swp *.o