CC=gcc
CFLAGS=-I$(IDIR) -O3 -DcRounds=$(CROUNDS) -DdRounds=$(DROUNDS)
LIBS = -lm

IDIR = ./include
ODIR = ./obj
SRC = ./src

_DEPS = siphash.h vectors.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

_OBJ = siphash.o workstation.o
OBJ = $(patsubst %, $(ODIR)/%, $(_OBJ))

CROUNDS = 1
DROUNDS = 3

all: 	$(OBJ) workstation


$(OBJ): $(ODIR)/%.o: $(SRC)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

workstation: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -rf $(ODIR)/%.o
	rm -rf ./workstation
