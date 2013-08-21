#include <stdio.h>
#include <stdlib.h>

// from HAL
void do_something_hal(int n);
extern int nb_port;

void do_something(int n) {
    
    printf("Do_something from generic: %d\n", n);
    printf("nb_port is %d\n", nb_port);
    do_something_hal(1001);
}
