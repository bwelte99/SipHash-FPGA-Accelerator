#Set compiler, compilation flags, and library args
CC=gcc
CFLAGS=-I$(IDIR) -O3 -DcROUNDS=$(CROUNDS) -DdROUNDS=$(DROUNDS)
LIBS = -lm

#Set paths to include, object, and source files
IDIR = ./include
ODIR = ./obj
SRC = ./src

#Set up dependencies based on the include directory & desired files
_DEPS = siphash.h vectors.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

#Set object file names based on object files directory & desired files
_OBJ = siphash.o workstation.o
OBJ = $(patsubst %, $(ODIR)/%, $(_OBJ))

#Default values of C & D for SipHash that can be overriden in the make command
CROUNDS = 2	
DROUNDS = 4

#default rule to reset object files and build executable
all: $(OBJ) workstation

#rule to create object files
$(OBJ): $(ODIR)/%.o: $(SRC)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

#rule to create executable from object files
workstation: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

#clean rule
.PHONY: clean
clean:
	rm -rf $(OBJ)
	rm -rf ./workstation
