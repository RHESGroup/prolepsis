#!/bin/bash

riscv_toolchain_path="/home/ale/Downloads/riscv-mod/bin"
recompile=1

instrument() {
 $riscv_toolchain_path/riscv32-unknown-elf-objdump -z -D -j .rodata -j .data -j .bss ./riscv32-benchmarks-customtoolchain/src/$1/$1 > ./riscv32-benchmarks-customtoolchain/src/$1/$1-data.list
 $riscv_toolchain_path/riscv32-unknown-elf-objdump -z -d -j .text -j .fini -j .init ./riscv32-benchmarks-customtoolchain/src/$1/$1 > ./riscv32-benchmarks-customtoolchain/src/$1/$1.list
  python3 main.py -disassembly ./riscv32-benchmarks-customtoolchain/src/$1/$1.list -disassemblyfull ./riscv32-benchmarks-customtoolchain/src/$1/$1-data.list -binary ./riscv32-benchmarks-customtoolchain/src/$1/$1 -outputfileassembly ./riscv32-benchmarks-customtoolchain/src/$1/$1_mod -outputfile ./riscv32-benchmarks-customtoolchain/src/$1/$1-instr -typesfile ./type_demo_2.json
  if [[ $recompile -eq 1 ]]
  then
    $riscv_toolchain_path/riscv32-unknown-elf-gcc -c -O0 -ffunction-sections -march=rv32im -mabi=ilp32 -o ./riscv32-benchmarks-customtoolchain/src/$1/$1_mod.o ./riscv32-benchmarks-customtoolchain/src/$1/$1_mod.s
    $riscv_toolchain_path/riscv32-unknown-elf-ld -o ./riscv32-benchmarks-customtoolchain/src/$1/$1_mod.elf ./riscv32-benchmarks-customtoolchain/src/$1/$1_mod.o
  fi
}

instrument aha-mont64
instrument crc32
#instrument cubic
instrument edn
#instrument huffbench
instrument matmult-int
#instrument md5sum
#instrument minver
#instrument nbody
instrument nettle-aes
instrument nettle-sha256
instrument nsichneu
instrument picojpeg
#instrument primecount
#instrument qrduino
#instrument sglib-combined
instrument slre
#instrument st
instrument statemate
#instrument tarfind
instrument ud
#instrument wikisort
