#!/bin/bash

recompile=0

instrument() {
 arm-none-eabi-objdump -z -d -j .text ./arm-benchmarks/src/$1/$1 > ./arm-benchmarks/src/$1/$1.list
 # arm-none-eabi-objdump -z -D -j .rodata -j .data -j .bss ./arm-benchmarks/src/$1/$1 > ./arm-benchmarks/src/$1/$1-data.list
 arm-none-eabi-objdump -z -D --start-address=0x20000000 --stop-address=0x20020000 ./arm-benchmarks/src/$1/$1 > ./arm-benchmarks/src/$1/$1-data.list


  python3 ./main.py -disassembly ./arm-benchmarks/src/$1/$1.list -disassemblyfull ./arm-benchmarks/src/$1/$1-data.list -binary ./arm-benchmarks/src/$1/$1 -outputfileassembly ./arm-benchmarks/src/$1/$1_mod -outputfile ./arm-benchmarks/src/$1/$1-instr -typesfile ./type_demo_prova.json
  
  if [[ $recompile -eq 1 ]]
  then
	  arm-none-eabi-gcc -nostartfiles -c -g3 -O0 -fno-function-sections -fno-data-sections -MMD -MP -mthumb --specs=nosys.specs -mcpu=cortex-m4 -Wa,-mimplicit-it=thumb -Wl,-gc-sections -o ./arm-benchmarks/src/$1/$1_mod.o ./arm-benchmarks/src/$1/$1_mod.s 
	  arm-none-eabi-ld -o ./arm-benchmarks/src/$1/$1_mod.elf ./arm-benchmarks/src/$1/$1_mod.o
  fi
}

instrument aha-mont64
instrument crc32
instrument cubic
instrument edn
instrument huffbench
instrument matmult-int
instrument md5sum
instrument minver
instrument nbody
instrument nettle-aes
instrument nettle-sha256
instrument nsichneu
instrument picojpeg
instrument primecount
instrument qrduino
instrument sglib-combined
instrument slre
instrument st
instrument statemate
instrument tarfind
instrument ud
instrument wikisort
