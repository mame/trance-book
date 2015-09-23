#ifndef __ASM_OFFSETS_H__
#define __ASM_OFFSETS_H__
/*
 * DO NOT MODIFY.
 *
 * This file was generated by Kbuild
 */

#define TASK_STATE 0 /* offsetof(struct task_struct, state)	# */
#define TASK_FLAGS 12 /* offsetof(struct task_struct, flags)	# */
#define TASK_PTRACE 16 /* offsetof(struct task_struct, ptrace)	# */
#define TASK_THREAD 620 /* offsetof(struct task_struct, thread)	# */
#define TASK_MM 280 /* offsetof(struct task_struct, mm)	# */
#define TASK_ACTIVE_MM 284 /* offsetof(struct task_struct, active_mm)	# */
#define TI_TASK 0 /* offsetof(struct thread_info, task)	# */
#define TI_FLAGS 8 /* offsetof(struct thread_info, flags)	# */
#define TI_PREEMPT 16 /* offsetof(struct thread_info, preempt_count)	# */
#define TI_KSP 24 /* offsetof(struct thread_info, ksp)	# */
#define PT_SIZE 144 /* sizeof(struct pt_regs)	# */
#define STACK_FRAME_OVERHEAD 128 /* STACK_FRAME_OVERHEAD	# */
#define INT_FRAME_SIZE 272 /* STACK_FRAME_OVERHEAD + sizeof(struct pt_regs)	# */
#define NUM_USER_SEGMENTS 8 /* TASK_SIZE >> 28	# */

#endif