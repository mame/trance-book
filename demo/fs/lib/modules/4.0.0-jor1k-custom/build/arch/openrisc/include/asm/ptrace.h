/*
 * OpenRISC Linux
 *
 * Linux architectural port borrowing liberally from similar works of
 * others.  All original copyrights apply as per the original source
 * declaration.
 *
 * OpenRISC implementation:
 * Copyright (C) 2003 Matjaz Breskvar <phoenix@bsemi.com>
 * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
 * et al.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */
#ifndef __ASM_OPENRISC_PTRACE_H
#define __ASM_OPENRISC_PTRACE_H


#include <asm/spr_defs.h>
#include <uapi/asm/ptrace.h>

/*
 * Make kernel PTrace/register structures opaque to userspace... userspace can
 * access thread state via the regset mechanism.  This allows us a bit of
 * flexibility in how we order the registers on the stack, permitting some
 * optimizations like packing call-clobbered registers together so that
 * they share a cacheline (not done yet, though... future optimization).
 */

#ifndef __ASSEMBLY__
/*
 * This struct describes how the registers are laid out on the kernel stack
 * during a syscall or other kernel entry.
 *
 * This structure should always be cacheline aligned on the stack.
 * FIXME: I don't think that's the case right now.  The alignment is
 * taken care of elsewhere... head.S, process.c, etc.
 */

struct pt_regs {
	union {
		struct {
			/* Named registers */
			long  sr;	/* Stored in place of r0 */
			long  sp;	/* r1 */
		};
		struct {
			/* Old style */
			long offset[2];
			long gprs[30];
		};
		struct {
			/* New style */
			long gpr[32];
		};
	};
	long  pc;
	/* For restarting system calls:
	 * Set to syscall number for syscall exceptions,
	 * -1 for all other exceptions.
	 */
	long  orig_gpr11;	/* For restarting system calls */
	long dummy;		/* Cheap alignment fix */
	long dummy2;		/* Cheap alignment fix */
};

/* TODO: Rename this to REDZONE because that's what it is */
#define STACK_FRAME_OVERHEAD  128  /* size of minimum stack frame */

#define instruction_pointer(regs)	((regs)->pc)
#define user_mode(regs)			(((regs)->sr & SPR_SR_SM) == 0)
#define user_stack_pointer(regs)	((unsigned long)(regs)->sp)
#define profile_pc(regs)		instruction_pointer(regs)

static inline long regs_return_value(struct pt_regs *regs)
{
	return regs->gpr[11];
}

#endif /* __ASSEMBLY__ */

#endif /* __ASM_OPENRISC_PTRACE_H */
