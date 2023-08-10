#ifndef _KERNEL_TTY_H
#define _KERNEL_TTY_H

#include <stddef.h>

/***
 * Initializes TTY terminal
 *
 * This is the basis of all IO.
 */
void terminal_initialize(void);

/***
 * Puts a single character to the TTY terminal
 *
 * Direct access.
 *
 * @param Character
 */
void terminal_putchar(char c);

/***
 * Write data to TTY terminal, terminator symbol optional.
 *
 * Quick to use.
 *
 * @param raw data pool
 * @param data size
 */
void terminal_write(const char *data, const size_t size);

/***
 * Write data with terminator symbol to TTY terminal.
 *
 * @param string with \0
 */
void terminal_write_string(const char *data);

#endif
