CC = clang
CFLAGS = -O2 -emit-llvm
LLCFLAGS = -march=bpf -filetype=obj

OFILES = \
  hello0.o \
  hello1.o \
  hello2.o \
  hello_neg1.o

all: $(OFILES)

hello0.o: hello.c
	$(CC) $(CFLAGS) -D RET0 -c $< -o - | llc $(LLCFLAGS) -o $@

hello1.o: hello.c
	$(CC) $(CFLAGS) -D RET1 -c $< -o - | llc $(LLCFLAGS) -o $@

hello2.o: hello.c
	$(CC) $(CFLAGS) -D RET2 -c $< -o - | llc $(LLCFLAGS) -o $@

hello_neg1.o: hello.c
	$(CC) $(CFLAGS)         -c $< -o - | llc $(LLCFLAGS) -o $@

.PHONY: clean
clean:
	rm -f $(OFILES)
