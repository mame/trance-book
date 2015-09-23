/* Definitions for <stdint.h> types on systems using uClibc.
   Copyright (C) 2008, 2009, 2011 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  */

#define SIG_ATOMIC_TYPE "int"

/* The newlib logic actually checks for sizes greater than 32 rather
   than equal to 64 for various 64-bit types.  */

#define INT8_TYPE (CHAR_TYPE_SIZE == 8 ? "signed char" : 0)
#define INT16_TYPE (SHORT_TYPE_SIZE == 16 ? "short int" : 0)
#define INT32_TYPE (INT_TYPE_SIZE == 32 ? "int" : 0)
#define INT64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : LONG_LONG_TYPE_SIZE == 64 ? "long long int" : 0)
#define UINT8_TYPE (CHAR_TYPE_SIZE == 8 ? "unsigned char" : 0)
/* uclibc-0.9.31/include/stdint.h has the 'unsigned' keyword first,
   but GCC needs the length keyword first.  */
#define UINT16_TYPE (SHORT_TYPE_SIZE == 16 ? "short unsigned int" : 0)
#define UINT32_TYPE (INT_TYPE_SIZE == 32 ? "unsigned int" : 0)
#define UINT64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : LONG_LONG_TYPE_SIZE == 64 ? "long long unsigned int" : 0)

#define INT_LEAST8_TYPE (INT8_TYPE ? INT8_TYPE : INT16_TYPE ? INT16_TYPE : INT32_TYPE ? INT32_TYPE : INT64_TYPE ? INT64_TYPE : 0)
#define INT_LEAST16_TYPE (INT16_TYPE ? INT16_TYPE : INT32_TYPE ? INT32_TYPE : INT64_TYPE ? INT64_TYPE : 0)
#define INT_LEAST32_TYPE (INT32_TYPE ? INT32_TYPE : INT64_TYPE ? INT64_TYPE : 0)
#define INT_LEAST64_TYPE INT64_TYPE
#define UINT_LEAST8_TYPE (UINT8_TYPE ? UINT8_TYPE : UINT16_TYPE ? UINT16_TYPE : UINT32_TYPE ? UINT32_TYPE : UINT64_TYPE ? UINT64_TYPE : 0)
#define UINT_LEAST16_TYPE (UINT16_TYPE ? UINT16_TYPE : UINT32_TYPE ? UINT32_TYPE : UINT64_TYPE ? UINT64_TYPE : 0)
#define UINT_LEAST32_TYPE (UINT32_TYPE ? UINT32_TYPE : UINT64_TYPE ? UINT64_TYPE : 0)
#define UINT_LEAST64_TYPE UINT64_TYPE

#define INT_FAST8_TYPE INT8_TYPE
#define UINT_FAST8_TYPE UINT8_TYPE

#if LONG_TYPE_SIZE == 64
#define INT_FAST16_TYPE "long int"
#define INT_FAST32_TYPE "long int"
#define INT_FAST64_TYPE "long int"
#define UINT_FAST16_TYPE "long unsigned int"
#define UINT_FAST32_TYPE "long unsigned int"
#define UINT_FAST64_TYPE "long unsigned int"
#else
#define INT_FAST16_TYPE "int"
#define INT_FAST32_TYPE "int"
#define INT_FAST64_TYPE "long long int"
#define UINT_FAST16_TYPE "unsigned int"
#define UINT_FAST32_TYPE "unsigned int"
#define UINT_FAST64_TYPE "long long unsigned int"
#endif

#if LONG_TYPE_SIZE == 64
#define INTPTR_TYPE "long int"
#define UINTPTR_TYPE "long unsigned int"
#else
#define INTPTR_TYPE "int"
#define UINTPTR_TYPE "unsigned int"
#endif
