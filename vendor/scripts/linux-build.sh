cd /home/build/openrisc-linux

case $1 in
config)
    echo -jor1k-custom > .scmversion
    make defconfig
    ;;
build)
    make olddefconfig
    make -j 4
    objcopy -O binary vmlinux vmlinux.bin
    make kernelversion > kernelversion
    ;;
esac
