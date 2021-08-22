# rust-simple-fs
simple file system driver writen in rust

# Build & load
---
On Ubuntu 20.04:
```shell
sudo apt install build-essential llvm clang-11 linux-headers-"$(uname -r)" curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default nightly
rustup component add --toolchain=nightly rust-src rustfmt

cd rust-simple-fs
make CC=clang-11
make load
```
