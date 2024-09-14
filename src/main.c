

#include <float.h>
#include <gcov.h>
#include <iso646.h>
#include <stdalign.h>
#include <stdarg.h>
#include <stdatomic.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdfix.h>
#include <stdint-gcc.h>
//#include <stdint.h>
#include <stdnoreturn.h>
//#include <tgmath.h>
#include <unwind.h>
//#include <varargs.h>


extern uint16_t * ram_start;

void main()
{
    *ram_start = 0x12;
    while(1)
    {
        asm volatile(
            "mov r1,r2\n"
            "mov r1,r2\n"
            "mov r1,r2\n"
            "mov r1,r2\n"
            "mov r1,r2\n"
            "mov r1,r2\n"
        );
    }
}


int program() {}
