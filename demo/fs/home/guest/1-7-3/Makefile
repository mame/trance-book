KDIR = /lib/modules/$(shell uname -r)/build
EXTRA_CFLAGS = -DKDIR=$(KDIR)
obj-m += quine.o
all:
	make -C $(KDIR) M=$(PWD) modules
clean:
	make -C $(KDIR) M=$(PWD) clean
