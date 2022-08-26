#!/bin/bash


read_text() {
 echo "[*] getting section size for $1 before instrumentation"
 readelf -S ./riscv32-benchmarks-customtoolchain/src/$1/$1 | grep -E '.text|Size'
 echo "[*] getting section size for $1 after instrumentation"
 readelf -S ./riscv32-benchmarks-customtoolchain/src/$1/$1_mod.elf | grep -E '.text|Size'
}

read_text aha-mont64
read_text crc32
read_text edn
read_text matmult-int
read_text nettle-aes
read_text nettle-sha256
read_text slre
read_text statemate
