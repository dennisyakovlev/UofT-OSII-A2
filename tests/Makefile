CC = g++
CC_FLAGS = -I. -march=native
DEPS = tests.h alloc.h
OBJS = basic.o unique.o alloc.o

.PHONY: clean copy test_phony

all: tests_phony

tests_phony: copy tests
	

tests: $(OBJS)
	$(CC) $(CC_FLAGS) -o tests main.cpp $^

%.o: %.cpp $(DEPS)
	$(CC) $(CC_FLAGS) -c -o $@ $<

copy:
	cp ../alloc.h .
	cp ../alloc.c alloc.cpp

clean:
	rm *.o tests
