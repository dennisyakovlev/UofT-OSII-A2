CC=g++
CC_FLAGS=-I. -march=native -std=c++17 -O3 -Wall -fmessage-length=0 -pipe -finline-limit=65000 -fkeep-inline-functions -finline-functions -ffast-math -fomit-frame-pointer -DNDEBUG -D_REENTRANT=1
LIBS=-lpthread
DEPS=tests.h alloc.h
#OBJS=basic.o unique.o multi_basic.o scale.o alloc.o
OBJS=unique.o alloc.o

.PHONY: clean copy test_phony

all: tests_phony

tests_phony: copy tests
	

tests: $(OBJS)
	$(CC) $(CC_FLAGS) -o tests main.cpp $^ $(LIBS)

%.o: %.cpp $(DEPS)
	$(CC) $(CC_FLAGS) -c -o $@ $< $(LIBS)

copy:
	cp ../alloc.h .
	cp ../alloc.c alloc.cpp

clean:
	rm *.o tests 
