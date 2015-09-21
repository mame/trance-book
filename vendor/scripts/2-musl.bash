#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR/musl-cross

cp $VENDOR/scripts/musl-or1k-config.sh config.sh
git apply $VENDOR/scripts/musl-linux.patch

./build.sh
