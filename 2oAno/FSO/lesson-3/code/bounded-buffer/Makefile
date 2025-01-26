CXX = g++
CXXFLAGS = -Wall -ggdb -pthread

TARGETS = bb-unsafe bb-safe Ex2 Ex3 Ex4

HEADERS = fifo.h process.h utils.h dbc.h

OBJS = process.o utils.o

.PHONY:	all clean cleanall

all: $(TARGETS)

bb-unsafe: main.o fifo-unsafe.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ main.o fifo-unsafe.o $(OBJS) $(CXXFLAGS)

bb-safe: main.o fifo-sem-safe.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ main.o fifo-sem-safe.o $(OBJS) $(CXXFLAGS)

Ex2: Ex2.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ Ex2.o $(OBJS) $(CXXFLAGS)

Ex3: Ex3.o $(OBJS) $(HEADERS)
	$(CXX) -o $@ Ex3.o $(OBJS) $(CXXFLAGS)

Ex4: Ex4.o fifo-Ex4.o $(OBJS) $(HEADERS) fifo-Ex4.h
	$(CXX) -o $@ Ex4.o fifo-Ex4.o $(OBJS) $(CXXFLAGS)

clean:
	rm -f *.o

cleanall:	clean
	rm -f $(TARGETS) 
