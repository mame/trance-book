/*
 * Copyright (C) 2014 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
 *
 * Based on arm64 and arc implementations
 * Copyright (C) 2013 ARM Ltd.
 * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
 *
 * This file is licensed under the terms of the GNU General Public License
 * version 2.  This program is licensed "as is" without any warranty of any
 * kind, whether express or implied.
 */

#include <linux/cpu.h>
#include <linux/sched.h>
#include <linux/irq.h>
#include <asm/cpuinfo.h>
#include <asm/mmu_context.h>
#include <asm/tlbflush.h>

volatile unsigned long secondary_release = -1;
struct thread_info *secondary_thread_info;

enum ipi_msg_type {
	IPI_RESCHEDULE,
	IPI_CALL_FUNC,
	IPI_CALL_FUNC_SINGLE,
	IPI_CPU_STOP,
	IPI_TIMER,
};

static phys_addr_t cpu_release_addr[NR_CPUS];
static DEFINE_SPINLOCK(boot_lock);

static int boot_secondary(unsigned int cpu, struct task_struct *idle)
{
	/*
	 * set synchronisation state between this boot processor
	 * and the secondary one
	 */
	spin_lock(&boot_lock);

	secondary_release = cpu;

	/*
	 * now the secondary core is starting up let it run its
         * calibrations, then wait for it to finish
         */
	spin_unlock(&boot_lock);

	return 0;
}

void __init smp_prepare_boot_cpu(void)
{
}

void __init smp_init_cpus(void)
{
	int i;

	for (i = 0; i < NR_CPUS; i++)
		set_cpu_possible(i, true);
}

void __init smp_prepare_cpus(unsigned int max_cpus)
{
	int i;

	/*
	 * Initialise the present map, which describes the set of CPUs
	 * actually populated at the present time.
	 */
	for (i = 0; i < max_cpus; i++)
		set_cpu_present(i, true);
}

void __init smp_cpus_done(unsigned int max_cpus)
{

}

static DECLARE_COMPLETION(cpu_running);

int __cpu_up(unsigned int cpu, struct task_struct *idle)
{
	int ret;

	secondary_thread_info = task_thread_info(idle);
	current_pgd[cpu] = init_mm.pgd;

	ret = boot_secondary(cpu, idle);
	if (ret == 0) {
		wait_for_completion_timeout(&cpu_running,
					    msecs_to_jiffies(1000));
		if (!cpu_online(cpu))
			ret = -EIO;
	}

	return ret;
}

extern void openrisc_clockevent_init(void);

asmlinkage void secondary_start_kernel(void)
{
	struct mm_struct *mm = &init_mm;
	unsigned int cpu = smp_processor_id();
	/*
	 * All kernel threads share the same mm context; grab a
	 * reference and switch to it.
	 */
	atomic_inc(&mm->mm_count);
	current->active_mm = mm;
	cpumask_set_cpu(cpu, mm_cpumask(mm));

	printk("CPU%u: Booted secondary processor\n", cpu);

	setup_cpuinfo();
	openrisc_clockevent_init();

	notify_cpu_starting(cpu);

	/*
	 * OK, now it's safe to let the boot CPU continue
	 */
	set_cpu_online(cpu, true);
	complete(&cpu_running);

	local_irq_enable();

	/*
	 * OK, it's off to the idle thread for us
	 */
	cpu_startup_entry(CPUHP_ONLINE);
}

void handle_IPI(int ipinr)
{
	unsigned int cpu = smp_processor_id();

	switch (ipinr) {
	case IPI_RESCHEDULE:
		scheduler_ipi();
		break;

	case IPI_CALL_FUNC:
		generic_smp_call_function_interrupt();
		break;

        case IPI_CALL_FUNC_SINGLE:
		generic_smp_call_function_single_interrupt();
		break;

	default:
		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
		BUG();
		break;
	}
}

static void (*smp_cross_call)(const struct cpumask *, unsigned int);

#ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
void tick_broadcast(const struct cpumask *mask)
{
	smp_cross_call(mask, IPI_TIMER);
}
#endif

void smp_send_reschedule(int cpu)
{
	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
}

void smp_send_stop(void)
{
	BUG(); /* SJK TODO */
}

void __init set_smp_cross_call(void (*fn)(const struct cpumask *, unsigned int))
{
	smp_cross_call = fn;
}

void arch_send_call_function_single_ipi(int cpu)
{
	smp_cross_call(cpumask_of(cpu), IPI_CALL_FUNC_SINGLE);
}

void arch_send_call_function_ipi_mask(const struct cpumask *mask)
{
	smp_cross_call(mask, IPI_CALL_FUNC);
}

/* TLB flush operations - Performed on each CPU*/
static inline void ipi_flush_tlb_all(void *ignored)
{
	local_flush_tlb_all();
}

void flush_tlb_all(void)
{
	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
}

/*
 * FIXME: implement proper functionality instead of flush_tlb_all.
 * *But*, as things currently stands, the local_tlb_flush_* functions will
 * all boil down to local_tlb_flush_all anyway.
 */
void flush_tlb_mm(struct mm_struct *mm)
{
	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
}

void flush_tlb_page(struct vm_area_struct *vma, unsigned long uaddr)
{
	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
}

void flush_tlb_range(struct vm_area_struct *vma,
		     unsigned long start, unsigned long end)
{
	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
}
