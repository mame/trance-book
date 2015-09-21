#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR/jor1k

ln -sf ../utils/fs bin/fs
ln -sf utils jor1k-sysroot
git apply $VENDOR/scripts/jor1k-terminal-size.patch
git apply $VENDOR/scripts/jor1k-fs2xml.patch

npm install
PATH=node_modules/.bin:$PATH ./compile
cd utils
./buildfs
