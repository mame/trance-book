#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

mkdir -p $VENDOR/jor1k/utils/packages/
cd $VENDOR/../demo/extended-fs
tar cf $VENDOR/jor1k/utils/packages/trance-demo.tar --owner=1000 --group=1000 home/
tar rf $VENDOR/jor1k/utils/packages/trance-demo.tar --owner=0 --group=0 usr
rm -f $VENDOR/jor1k/utils/packages/trance-demo.tar.bz2
bzip2 $VENDOR/jor1k/utils/packages/trance-demo.tar
