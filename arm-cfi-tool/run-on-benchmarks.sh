#!/bin/bash

arm_toolchain_path="/home/ale/Downloads/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/gcc-arm-none-eabi-10.3-2021.10/bin"
recompile=1


instrument() {
 $arm_toolchain_path/arm-none-eabi-objdump -z -D -j .rodata -j .data -j .bss ./arm-benchmarks/src/$1/$1 > ./arm-benchmarks/src/$1/$1-data.list
 $arm_toolchain_path/arm-none-eabi-objdump -z -d -j .text -j .fini -j .init ./arm-benchmarks/src/$1/$1 > ./arm-benchmarks/src/$1/$1.list

  python3 ./tool-cfi/main.py -disassembly ./arm-benchmarks/src/$1/$1.list -disassemblyfull ./arm-benchmarks/src/$1/$1-data.list -binary ./arm-benchmarks/src/$1/$1 -outputfileassembly ./arm-benchmarks/src/$1/$1_mod -outputfile ./arm-benchmarks/src/$1/$1-instr -typesfile ./type_demo_prova.json
  
  if [[ $recompile -eq 1 ]]
  then
	  $arm_toolchain_path/arm-none-eabi-gcc -c -O0  -ffunction-sections -MMD -MP -mthumb --specs=nosys.specs -mcpu=cortex-m4 -Wa,-mimplicit-it=thumb -Wl,-gc-sections -o ./arm-benchmarks/src/$1/$1_mod.o ./arm-benchmarks/src/$1/$1_mod.s 
	  $arm_toolchain_path/arm-none-eabi-ld -o ./arm-benchmarks/src/$1/$1_mod.elf ./arm-benchmarks/src/$1/$1_mod.o
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
