	.file	"asm-offsets.c"
# GNU C (GCC) version 4.9.1 (or1k-linux-musl)
#	compiled by GNU C version 4.9.1, GMP version 6.0.0, MPFR version 3.1.2, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -nostdinc -I ./arch/openrisc/include
# -I arch/openrisc/include/generated/uapi
# -I arch/openrisc/include/generated -I include
# -I ./arch/openrisc/include/uapi -I arch/openrisc/include/generated/uapi
# -I ./include/uapi -I include/generated/uapi -D __KERNEL__ -D __linux__
# -D CC_HAVE_ASM_GOTO -D KBUILD_STR(s)=#s
# -D KBUILD_BASENAME=KBUILD_STR(asm_offsets)
# -D KBUILD_MODNAME=KBUILD_STR(asm_offsets)
# -isystem /usr/lib/gcc/or1k-linux-musl/4.9.1/include
# -include ./include/linux/kconfig.h
# -MD arch/openrisc/kernel/.asm-offsets.s.d
# arch/openrisc/kernel/asm-offsets.c -mhard-mul -mhard-div
# -auxbase-strip arch/openrisc/kernel/asm-offsets.s -O2 -Wall -Wundef
# -Wstrict-prototypes -Wno-trigraphs -Werror=implicit-function-declaration
# -Wno-format-security -Wframe-larger-than=1024
# -Wno-unused-but-set-variable -Wdeclaration-after-statement
# -Wno-pointer-sign -Werror=implicit-int -Werror=strict-prototypes
# -Werror=date-time -std=gnu90 -fno-strict-aliasing -fno-common -ffixed-r10
# -fno-delete-null-pointer-checks -fno-stack-protector -fomit-frame-pointer
# -fno-var-tracking-assignments -fno-strict-overflow -fconserve-stack
# -fverbose-asm --param allow-store-data-races=0
# options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdelayed-branch -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffunction-cse -fgcse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpcc-struct-return -fpeephole
# -fpeephole2 -fprefetch-loop-arrays -freorder-blocks -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
# -fschedule-insns2 -fshow-column -fshrink-wrap -fsigned-zeros
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
# -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
# -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss
# -mmusl

	.section	.text.startup,"ax",@progbits
	.align	4
.proc	main
	.global main
	.type	main, @function
main:
.LFB1417:
	.cfi_startproc
	l.sw    	-4(r1),r1	 # SI store	#,
	.cfi_offset 1, -4
	l.addi  	r1,r1,-4 # addsi3	#,,
	.cfi_def_cfa_offset 4
#APP
# 45 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TASK_STATE 0 offsetof(struct task_struct, state)	#
# 0 "" 2
# 46 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TASK_FLAGS 12 offsetof(struct task_struct, flags)	#
# 0 "" 2
# 47 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TASK_PTRACE 16 offsetof(struct task_struct, ptrace)	#
# 0 "" 2
# 48 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TASK_THREAD 620 offsetof(struct task_struct, thread)	#
# 0 "" 2
# 49 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TASK_MM 280 offsetof(struct task_struct, mm)	#
# 0 "" 2
# 50 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TASK_ACTIVE_MM 284 offsetof(struct task_struct, active_mm)	#
# 0 "" 2
# 53 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TI_TASK 0 offsetof(struct thread_info, task)	#
# 0 "" 2
# 54 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TI_FLAGS 8 offsetof(struct thread_info, flags)	#
# 0 "" 2
# 55 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TI_PREEMPT 16 offsetof(struct thread_info, preempt_count)	#
# 0 "" 2
# 56 "arch/openrisc/kernel/asm-offsets.c" 1
	
->TI_KSP 24 offsetof(struct thread_info, ksp)	#
# 0 "" 2
# 58 "arch/openrisc/kernel/asm-offsets.c" 1
	
->PT_SIZE 144 sizeof(struct pt_regs)	#
# 0 "" 2
# 61 "arch/openrisc/kernel/asm-offsets.c" 1
	
->STACK_FRAME_OVERHEAD 128 STACK_FRAME_OVERHEAD	#
# 0 "" 2
# 62 "arch/openrisc/kernel/asm-offsets.c" 1
	
->INT_FRAME_SIZE 272 STACK_FRAME_OVERHEAD + sizeof(struct pt_regs)	#
# 0 "" 2
# 64 "arch/openrisc/kernel/asm-offsets.c" 1
	
->NUM_USER_SEGMENTS 8 TASK_SIZE >> 28	#
# 0 "" 2
#NO_APP
	l.addi	r1,r1,4	#
	l.addi  	r11,r0,0	 # move immediate I	#,
	l.jr    	r9	# return_internal	# delay slot filled	#
	l.lwz   	r1,-4(r1)	 # SI load	#,
	.cfi_endproc
.LFE1417:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.1"
