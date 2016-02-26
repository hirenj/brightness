#!/usr/bin/env make -f
# Makefile to build brightness

override CFLAGS += -mmacosx-version-min=10.6

all: build

build: brightness

brightness: brightness.o
	$(CC) $(CFLAGS) $(ARCH_FLAGS) -framework IOKit -framework ApplicationServices \
		$^ -o $@

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(ARCH_FLAGS) $< -c -o $@

clean:
	/bin/rm -f brightness *.o

install:
	/bin/mkdir -p $(PREFIX)/bin
	/usr/bin/install -s -m 0755 brightness $(PREFIX)/bin