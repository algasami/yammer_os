# It is recommended to use this bash script in a new build directory.
SYSTEM_HEADER_PROJECTS="libc kernel"
PROJECTS="libc kernel"

export PATH="~/Desktop/operating/opt/cross/bin:${PATH}"
export HOST=${HOST:-$(./default-host.sh)}

export MAKE=${MAKE:-make}
export AR=${HOST}-ar
export AS=${HOST}-as
export CC=${HOST}-gcc

export PREFIX=/usr
export EXEC_PREFIX=${PREFIX}
export BOOTDIR=/boot
export LIBDIR=${EXEC_PREFIX}/lib
export INCLUDEDIR=${PREFIX}/include

export CFLAGS="-O2 -g"
export SYSROOT="$(pwd)/sysroot"

export CC="$CC --sysroot=$SYSROOT"

# Work around that the -elf gcc targets doesn't have a system include directory
# because it was configured with --without-headers rather than --with-sysroot.
if echo "$HOST" | grep -Eq -- '-elf($|-)'; then
    export CC="$CC -isystem=$INCLUDEDIR"
fi

