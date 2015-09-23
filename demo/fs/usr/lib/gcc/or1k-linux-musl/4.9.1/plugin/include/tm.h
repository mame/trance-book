#ifndef GCC_TM_H
#define GCC_TM_H
#ifndef LIBC_GLIBC
# define LIBC_GLIBC 1
#endif
#ifndef LIBC_UCLIBC
# define LIBC_UCLIBC 2
#endif
#ifndef LIBC_BIONIC
# define LIBC_BIONIC 3
#endif
#ifndef LIBC_MUSL
# define LIBC_MUSL 4
#endif
#ifndef DEFAULT_LIBC
# define DEFAULT_LIBC LIBC_MUSL
#endif
#ifndef ANDROID_DEFAULT
# define ANDROID_DEFAULT 0
#endif
#ifndef OR1K_DELAY_DEFAULT
# define OR1K_DELAY_DEFAULT OR1K_DELAY_ON
#endif
#ifdef IN_GCC
# include "options.h"
# include "insn-constants.h"
# include "config/or1k/or1k.h"
# include "config/dbxelf.h"
# include "config/elfos.h"
# include "config/or1k/elf.h"
# include "config/gnu-user.h"
# include "config/linux.h"
# include "config/or1k/linux-gas.h"
# include "config/or1k/linux-elf.h"
# include "config/uclibc-stdint.h"
# include "config/initfini-array.h"
#endif
#if defined IN_GCC && !defined GENERATOR_FILE && !defined USED_FOR_TARGET
# include "insn-flags.h"
#endif
#if defined IN_GCC && !defined GENERATOR_FILE
# include "insn-modes.h"
#endif
# include "defaults.h"
#endif /* GCC_TM_H */
