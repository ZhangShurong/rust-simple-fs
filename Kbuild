obj-m := rustfs.o
rustfs-objs := rustfs.rust.o

CARGO ?= cargo

export c_flags

$(src)/target/x86_64-unknown-none-linuxkernel/debug/lib%.a: cargo_will_determine_dependencies
	cd $(src); $(CARGO) build -Z build-std=core,alloc --target=x86_64-unknown-none-linuxkernel
	touch $(src)/.rustfs.rust.o.cmd

.PHONY: cargo_will_determine_dependencies

%.rust.o: target/x86_64-unknown-none-linuxkernel/debug/lib%.a
	$(LD) -r -o $@ --whole-archive $<