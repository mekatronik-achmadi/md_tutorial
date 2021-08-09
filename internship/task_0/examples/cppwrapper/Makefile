EXECUTABLE=contohExample

CC=g++
INCDIR=-I./
CFLAGS=-Wall
LDFLAGS=
LIBFLAGS=

SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.c=.o)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $(EXECUTABLE) $(LIBFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCDIR) -c -o $@ $<

clean:
	rm -f $(EXECUTABLE) $(OBJECTS)
