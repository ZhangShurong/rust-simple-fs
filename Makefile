export KDIR ?= /lib/modules/$(shell uname -r)/build

CLANG ?= clang
ifeq ($(origin CC),default)
CC := ${CLANG}
endif

all:
	$(MAKE) -C $(KDIR) M=$(CURDIR) CC=$(CC) CONFIG_CC_IS_CLANG=y

clean:
	$(MAKE) -C $(KDIR) M=$(CURDIR) CC=$(CC) clean
	rm -rf $(CURDIR)/target
	rm  $(CURDIR)/Cargo.lock

.PHONY: load unload
unload:
	$(if $(strip $(shell lsmod | grep rustfs)), sudo rmmod rustfs)
	$(if $(wildcard /dev/rustfs), sudo rm /dev/rustfs)

load: unload
	sudo insmod rustfs.ko
	sudo mknod --mode=a=rw /dev/rustfs c $$(cat /proc/devices | grep rustfs | cut -d' ' -f1) 0

