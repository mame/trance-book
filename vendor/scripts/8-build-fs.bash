#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR

if [ -f sysroot/home/build/openrisc-linux/vmlinux.bin.bz2 ]; then
    cp sysroot/home/build/openrisc-linux/vmlinux.bin.bz2 jor1k/bin/or1k
fi

cd $VENDOR/jor1k/utils
rm -rf fs

packages=(
"binutils.tar.bz2"
"eudev.tar.bz2"
"expat.tar.bz2"
"file.tar.bz2"
"font.tar.bz2"
"gcc-libs.tar.bz2"
"gcc.tar.bz2"
"libevdev.tar.bz2"
"libevent-dev.tar.bz2"
"libevent.tar.bz2"
"libffi.tar.bz2"
"libinput.tar.bz2"
"make.tar.bz2"
"mtdev.tar.bz2"
"musl-dev.tar.bz2"
"musl.tar.bz2"
"ncurses-dev.tar.bz2"
"ncurses.tar.bz2"
"vim.tar.bz2"
"zlib-dev.tar.bz2"
"zlib.tar.bz2"
"ruby.tar.bz2"
"linux-headers.tar.bz2"
"trance-demo.tar.bz2"
)

list=""

for i in "${packages[@]}"
do
    if [ -f packages/$i ] ; then
	list+=packages/$i" "
    fi
done

./fs2xml $list
