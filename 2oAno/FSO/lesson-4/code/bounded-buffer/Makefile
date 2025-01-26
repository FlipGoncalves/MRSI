CXX = g++
CXXFLAGS = -Wall -ggdb -pthread

TARGETS = bb-unsafe bb-safe Ex2 Ex3

OBJS = thread.o utils.o

.PHONY:	all clean cleanall

all: $(TARGETS)

bb-unsafe: main.o fifo-unsafe.o $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS)

bb-safe: main.o fifo-mon-safe.o $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS)

Ex2: Ex2.o $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS)

Ex3: Ex3.o $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS)

*.o:	*.h

clean:
	rm -f *.o

cleanall:	clean
	rm -f $(TARGETS) 
