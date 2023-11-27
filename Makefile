.SUFFIXES:
.SUFFIXES: .s .o .out .xml .log

ASFLAGS=-g --warn --fatal-warnings
LDFLAGS=--fatal-warnings

AOUTSOURCE=$(wildcard *.s)
AOUTOBJECT=$(AOUTSOURCE:.s=.o)

run:	a.out
	./a.out

.s.o:
	as $(ASFLAGS) $< -o $@

a.out:	$(AOUTOBJECT)
	ld $(LDFLAGS) $^

setup:
	# install build tools and make
	sudo apt install -y build-essential make 

clean:
	rm -f $(AOUTOBJECT) *.out *.xml *.log
