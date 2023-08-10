SYSTEM_HEADER_PROJECTS=libc kernel
PROJECTS=libc kernel

export HOST!=./default-host.sh
export AR?=${HOST}-ar
export AS?=${HOST}-as
export CC?=${HOST}-gcc

export PREFIX:=/usr
export EXEC_PREFIX:=${PREFIX}
export BOOTDIR:=/boot
export LIBDIR:=${EXEC_PREFIX}/lib
export INCLUDEDIR:=${PREFIX}/include

export CFLAGS:=-O2 -g
export PWD:=${shell pwd}
export SYSROOT:=${PWD}/sysroot
export DESTDIR:=${SYSROOT}
export CC_ARGS:=--sysroot=${SYSROOT} -isystem=${INCLUDEDIR}

export MAKE:=make

export PATH:=${PWD}/opt/cross/bin:${PATH}


all: install install-headers build bake-iso qemu clean

.PHONY: install install-headers build bake-iso qemu clean

install:
	for dir in ${PROJECTS}; do \
		${MAKE} -C $$dir install; \
	done

install-headers:
	for dir in ${PROJECTS}; do \
		${MAKE} -C $$dir install-headers; \
	done


clean:
	for dir in ${PROJECTS}; do \
		${MAKE} -C $$dir clean; \
	done
	rm -rf sysroot
	rm -rf isodir
	rm -rf myos.iso

build: install-headers install
	@echo "**If you are not using build.sh, you will not get smart compile_commands.json (no clangd in coc.nvim)**"

bake-iso: build
	mkdir -p isodir/boot/grub
	cp sysroot/boot/myos.kernel isodir/boot/myos.kernel
	echo 'menuentry "myos" {' > isodir/boot/grub/grub.cfg
	echo '	multiboot /boot/myos.kernel' >> isodir/boot/grub/grub.cfg
	echo '}' >> isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir

qemu: bake-iso
	qemu-system-i386 -vga virtio -cdrom myos.iso
