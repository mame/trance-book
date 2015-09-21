#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR/ruby

autoconf
./configure CC=or1k-linux-musl-gcc --prefix=/usr --with-destdir=. \
    --target=or1k-linux-musl --host=or1k-linux-musl \
    --disable-ipv6 --disable-rubygems --disable-install-doc \
    --disable-largefile --disable-dln \
    --with-zlib-dir=$VENDOR/local \
    --with-ext=zlib --with-static-linked-ext

make -j 4 ENCS="--no-encs=* --no-transes=*"
make install ENCS="--no-encs=* --no-transes=*"
or1k-linux-musl-strip usr/bin/ruby

tar cjf ruby.tar.bz2 usr/bin/ruby usr/bin/irb usr/bin/erb usr/lib/ruby \
    --format=ustar --owner=root --group=root
mv ruby.tar.bz2 $VENDOR/jor1k/utils/packages/
