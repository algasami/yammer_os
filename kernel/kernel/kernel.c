#include <kernel/tty.h>
#include <stddef.h>
#include <stdint.h>

int kernel_main()
{
    terminal_initialize();

    const char welcome_message[] = "**YAMMER OS**\n"
                                   "Sleep well, eat well and relax.\n"
                                   "\n"
                                   "Kernel-OS interconnection establishing... Please stand by\n";

    terminal_write_string(welcome_message);

    return 0;
}
