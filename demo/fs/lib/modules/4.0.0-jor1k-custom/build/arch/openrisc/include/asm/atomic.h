/*
 * Copyright (C) 2014 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
 *
 * This file is licensed under the terms of the GNU General Public License
 * version 2.  This program is licensed "as is" without any warranty of any
 * kind, whether express or implied.
 */

#ifndef __ASM_OPENRISC_ATOMIC_H
#define __ASM_OPENRISC_ATOMIC_H

#include <linux/types.h>

#ifdef CONFIG_OPENRISC_HAVE_INST_LWA_SWA

static inline int atomic_add_return(int i, atomic_t *v)
{
	int tmp;

	__asm__ __volatile__(
		"1:	l.lwa	%0,0(%1)	\n"
		"	l.add	%0,%0,%2	\n"
		"	l.swa	0(%1),%0	\n"
		"	l.bnf	1b		\n"
		"	 l.nop			\n"
		: "=&r"(tmp)
		: "r"(&v->counter), "r"(i)
		: "cc", "memory");

	return tmp;
}

static inline int atomic_sub_return(int i, atomic_t *v)
{
	int tmp;

	__asm__ __volatile__(
		"1:	l.lwa	%0,0(%1)	\n"
		"	l.sub	%0,%0,%2	\n"
		"	l.swa	0(%1),%0	\n"
		"	l.bnf	1b		\n"
		"	 l.nop			\n"
		: "=&r"(tmp)
		: "r"(&v->counter), "r"(i)
		: "cc", "memory");

	return tmp;
}

static inline void atomic_clear_mask(unsigned long mask, atomic_t *v)
{
	unsigned long tmp;

	__asm__ __volatile__(
		"1:	l.lwa	%0,0(%1)	\n"
		"	l.and	%0,%0,%2	\n"
		"	l.swa	0(%1),%0	\n"
		"	l.bnf	1b		\n"
		"	 l.nop			\n"
		: "=&r"(tmp)
		: "r"(&v->counter), "r"(mask)
		: "cc", "memory");
}

static inline void atomic_set_mask(unsigned long mask, atomic_t *v)
{
	unsigned long tmp;

	__asm__ __volatile__(
		"1:	l.lwa	%0,0(%1)	\n"
		"	l.or	%0,%0,%2	\n"
		"	l.swa	0(%1),%0	\n"
		"	l.bnf	1b		\n"
		"	 l.nop			\n"
		: "=&r"(tmp)
		: "r"(&v->counter), "r"(mask)
		: "cc", "memory");
}

#define atomic_add_return	atomic_add_return
#define atomic_sub_return	atomic_sub_return
#define atomic_clear_mask	atomic_clear_mask
#define atomic_set_mask		atomic_set_mask

#endif
#include <asm-generic/atomic.h>

#endif /* __ASM_OPENRISC_ATOMIC_H */
