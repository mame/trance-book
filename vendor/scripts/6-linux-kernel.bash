#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR

wget -c http://www.jor1k.com/or1k-toolchain.tar.bz2 -O or1k-toolchain.tar.bz2
tar xjf or1k-toolchain.tar.bz2

cd $VENDOR/sysroot
for i in $VENDOR/jor1k/utils/packages/*; do tar xjf $i; done
mkdir -p home/build
cp -r $VENDOR/openrisc-linux home/build
mv $VENDOR/or1k-toolchain/patches home/build
cp $VENDOR/scripts/linux-build.sh home/build

chroot . /usr/bin/qemu-or1k-static \
    -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin \
    bin/bash /home/build/linux-build.sh config

cd $VENDOR/sysroot/home/build/openrisc-linux

# from or1k-toolchain/Makefile
cp arch/openrisc/mm/fault.c arch/openrisc/mm/fault.c.bak
patch -p1 < ../patches/linux/move_protection_fault_new.patch
mv arch/openrisc/mm/fault.c.bak arch/openrisc/mm/fault.c
patch -p1 < ../patches/linux/linux-fault-print.diff
patch -p1 < ../patches/linux/linux-trap.diff
patch -p1 < ../patches/linux/linux-ptrace-peekuser.diff
patch -p1 < ../patches/linux/linux-ptrace-headers.diff
cp ../patches/linux/or1ksim.dts arch/openrisc/boot/dts
sed -i~ -e "s/root=host/root=host loglevel=0/g" arch/openrisc/boot/dts/or1ksim.dts
cp ../patches/linux/opencores-kbd.c drivers/input/keyboard/
cp ../patches/linux/CONFIG_LINUX .config
sed -i~ -e "s/or32/or1k/g" arch/openrisc/kernel/vmlinux.lds.S
sed -i~ -e "s/depends on ARCH_LPC32XX//g" drivers/input/touchscreen/Kconfig
sed -i~ -e "s/depends on ARCH_LPC32XX//g" drivers/rtc/Kconfig
sed -i~ -e "s/default 100 if HZ_100/default 50 if HZ_100/g" kernel/Kconfig.hz
sed -i~ -e "s/pr_notice(\"random: %s/\/\//g" drivers/char/random.c
sed -i~ -e "/depends on CPU_SUBTYPE_SH7760/d" sound/soc/sh/Kconfig
sed -i~ -e "/depends on SUPERH/d" sound/soc/sh/Kconfig
sed -i~ -e "s/8000_96000/11025/" sound/soc/sh/fsi.c
sed -i~ -e "s/or1k-linux-musl-//" .config

cd $VENDOR/sysroot
chroot . /usr/bin/qemu-or1k-static \
    -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin \
    bin/bash /home/build/linux-build.sh build

bzip2 -f --best home/build/openrisc-linux/vmlinux.bin
