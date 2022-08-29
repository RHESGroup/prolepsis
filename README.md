# PROLEPSIS - Binary Instrumentation Tool for Control-Flow Integrity in ARM and RISC-V 

PROLEPSIS is a Python tool to automatically retrieve the set
of destinations for each control-flow transfer instruction in binary applications, by using static analysis on the
program, and then instrument the code with instructions that are externally provided depending on the custom CFI monitor employed. PROLEPSIS makes ARM and RISC-V programs resistant to Code-Reuse attack techniques
and other attacks aiming at hijacking the execution flow of a program.
The tool exploits the abstractions provided by the reverse-engineering framework `Radare2` for program analysis.

`arm-cfi-tool` wraps code and benchmarks for the instrumentator working
on binaries compiled against ARM architecture. `risc-v-cfi-tool` wraps code and benchmarks for the instrumentator working on binaries compiled against RISC-V architecture.
You can find all the information about each of them in the `README.md` in their respective folders.

All code and material is released under LGPL v3.0 ( https://www.gnu.org/licenses/lgpl-3.0.txt ). Copyright (C) 2022 RHES Group Torino.