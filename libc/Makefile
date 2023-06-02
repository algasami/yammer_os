DEFAULT_HOST!=../default-host.sh
HOST?=${DEFAULT_HOST}
HOSTARCH!=../target-to-arch.sh ${HOST}

CFLAGS?=-O2 -g
CPPFLAGS?=
LDFLAGS?=
LIBS?=

DESTDIR?=
PREFIX?=/usr/local
EXEC_PREFIX?=${PREFIX}
INCLUDEDIR?=${PREFIX}/include
LIBDIR?=${EXEC_PREFIX}/lib

CFLAGS:=${CFLAGS} -ffreestanding -Wall -Wextra
CPPFLAGS:=${CPPFLAGS} -D__is_libc -Iinclude
LIBK_CFLAGS:=${CFLAGS}
LIBK_CPPFLAGS:=${CPPFLAGS} -D__is_libk

ARCHDIR=arch/${HOSTARCH}

include ${ARCHDIR}/make.config

CFLAGS:=${CFLAGS} ${ARCH_CFLAGS}
CPPFLAGS:=${CPPFLAGS} ${ARCH_CPPFLAGS}
LIBK_CFLAGS:=${LIBK_CFLAGS} ${KERNEL_ARCH_CFLAGS}
LIBK_CPPFLAGS:=${LIBK_CPPFLAGS} ${KERNEL_ARCH_CPPFLAGS}

.PHONY: all install install-headers clean

all: install install-headers clean

install:
	@echo libc is not implemented!

install-headers:
	@echo libc is not implemented!

clean:
	@echo libc is not implemented!
