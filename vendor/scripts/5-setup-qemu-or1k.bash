#!/bin/bash
source $(dirname $BASH_SOURCE)/config.sh

cd $VENDOR
#if [ ! -d sysroot ]; then
#    debootstrap --foreign --arch or1k unstable sysroot \
#	http://openrisc.debian.net/
#fi
#
#if [ ! -f sysroot/usr/bin/qemu-or1k-static ]; then
#    wget http://openrisc.debian.net/qemu-or1k-static.atomic \
#	-O sysroot/usr/bin/qemu-or1k-static
#    chmod u+x sysroot/usr/bin/qemu-or1k-static
#fi
#
#chroot sysroot /usr/bin/qemu-or1k-static \
#    -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin \
#    bin/bash /debootstrap/debootstrap --second-stage 

debootstrap --arch or1k unstable sysroot http://openrisc.debian.net/ || echo ok?
wget http://openrisc.debian.net/qemu-or1k-static.atomic \
    -O sysroot/usr/bin/qemu-or1k-static
chmod u+x sysroot/usr/bin/qemu-or1k-static
ln -s mawk sysroot/usr/bin/awk
