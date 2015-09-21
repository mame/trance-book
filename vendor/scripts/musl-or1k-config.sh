# from http://opencores.org/or1k/OpenRISC_GNU_tool_chain
CC_PREFIX=$VENDOR/local
ARCH=or1k
GCC_URL=https://github.com/openrisc/or1k-gcc/archive/musl-4.9.1.tar.gz
GCC_EXTRACT_DIR=or1k-gcc-musl-4.9.1
GCC_VERSION=or1k-4.9.1
MAKEFLAGS=-j4
GCC_STAGE1_NOOPT=1
MUSL_VERSION=1.1.5
