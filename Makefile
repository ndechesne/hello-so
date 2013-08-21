

all: hal generic  main


hal:
	gcc -fPIC -c -Wall -g hal.c
	gcc -shared -Wl,-soname,libhal.so.1 -o libhal.so.1 hal.o
	ln -sf libhal.so.1 libhal.so

generic:
	gcc -fPIC -c -Wall -g generic.c
	gcc -shared -Wl,-soname,libgeneric.so.1 -L. -lhal -o libgeneric.so.1 generic.o
	ln -sf libgeneric.so.1 libgeneric.so

main:
	gcc -fPIC -c -Wall -g main.c
	gcc -o apps main.o  libgeneric.so libhal.so

clean:
	rm -f *.so
	rm -f *.so.1
	rm -f *.o
	rm -f apps

