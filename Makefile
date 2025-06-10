# MacOSX will typically alias these as gcc and g++
#CC=clang
#CXX=clang++

CC=gcc
CXX=g++

#CFLAGS=-g
CFLAGS=-O3

CXXFLAGS=$(CFLAGS) -std=c++11

INC_FLAGS=-Ilibpng -IDivQuant

LIBS=-lz -lpng

DIVQUANT_OBJS=\
DivQuant/DivQuantCluster.o \
DivQuant/DivQuantMapColors.o \
DivQuant/DivQuantMisc.o \
DivQuant/DivQuantUni.o \
DivQuant/quant_util.o

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

main: $(DIVQUANT_OBJS) main.cpp
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) -o DivQuantCluster main.cpp $(DIVQUANT_OBJS) $(LIBS)

all: main

clean:
	rm -f $(DIVQUANT_OBJS)
