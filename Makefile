CC = g++
CC_FLAGS = -I. -ggdb3 -fsanitize=address -std=c99 -Wstrict-prototypes -Wall -Wshadow -Wextra -march=native
OBJ_DEPS = alloc.o

TEST_FLAGS = -std=gnu99 -Wall -fmessage-length=0 -pipe -O3 -finline-limit=65000 -fkeep-inline-functions -finline-functions -ffast-math -fomit-frame-pointer -D_REENTRANT=1 -march=native

TEST_DEPS = memlib.c mm_thread.c timer.c alloc.c
TEST_FLAGS_DBG = -std=gnu99 -Wall -g -D_REENTRANT=1 -march=native


.PHONY: tests clean

all: main main2 linux-scalability linux-scalability-dbg larson larson-dbg

main:  main.c
	$(CC) $(CC_FLAGS) $^ -o $@

main2: main2.c
	$(CC) $(CC_FLAGS) $^ -o $@

linux-scalability: $(TEST_DEPS) linux-scalability.c
	gcc $(TEST_FLAGS) $^ -lm -o $@

linux-scalability-dbg: $(TEST_DEPS) linux-scalability.c
	gcc $(TEST_FLAGS_DBG) $^ -lm -o $@

larson: $(TEST_DEPS) larson.c
	gcc $(TEST_FLAGS) $^ -lm -o $@

larson-dbg: $(TEST_DEPS) larson.c
	gcc $(TEST_FLAGS_DBG) $^ -lm -o $@

tests: 
	cd tests; make

%.o: %.c %.h
	$(CC) $(CC_FLAGS) -c $<

clean:
	rm *.out *.o main main2 linux-scalability linux-scalability-dbg
