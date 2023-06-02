#include <stddef.h>

int kernel_main()
{
    terminal_write("Hello", (size_t)6);
    return 0;
}
