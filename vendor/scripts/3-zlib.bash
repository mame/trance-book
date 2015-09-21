#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR/zlib

CC=or1k-linux-musl-gcc ./configure --prefix=$VENDOR/local
make -j 4
make install
