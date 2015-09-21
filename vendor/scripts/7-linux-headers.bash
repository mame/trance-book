#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR
KERNELVERSION=$(cat sysroot/home/build/openrisc-linux/kernelversion)$(cat sysroot/home/build/openrisc-linux/.scmversion)
mkdir -p lib/modules/$KERNELVERSION/build/arch
cp -a sysroot/home/build/openrisc-linux/arch/openrisc lib/modules/$KERNELVERSION/build/arch/
rm -r lib/modules/$KERNELVERSION/build/arch/openrisc/support/
cp -a sysroot/home/build/openrisc-linux/include lib/modules/$KERNELVERSION/build/
cp -a sysroot/home/build/openrisc-linux/scripts lib/modules/$KERNELVERSION/build/
cp -a sysroot/home/build/openrisc-linux/Makefile lib/modules/$KERNELVERSION/build/
cp -a sysroot/home/build/openrisc-linux/Module.symvers lib/modules/$KERNELVERSION/build/
find lib -name \*.o -delete
find lib -name .\*.cmd -delete
tar cjf jor1k/utils/packages/linux-headers.tar.bz2 lib --format=ustar --owner=root --group=root --files-from=loaded-linux-headers.txt
