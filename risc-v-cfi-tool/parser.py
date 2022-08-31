import json
import sys

def parse(filename):
	f = open(filename)
	data = json.load(f)

	l = []
	for d in data:
		l2 = list(map(lambda x: [str(d["source"]["source_addr"]),str(x["dest_addr"])],d["destinations"]))
		l.extend(l2)
		
	print("filename: %s\tedges: %d"%(filename,len(l)))
	
	
filenames = ["./riscv32-benchmarks-customtoolchain/src/matmult-int/matmult-int-instr.json",
"./riscv32-benchmarks-customtoolchain/src/slre/slre-instr.json",
"./riscv32-benchmarks-customtoolchain/src/huffbench/huffbench-instr.json",
"./riscv32-benchmarks-customtoolchain/src/primecount/primecount-instr.json",
"./riscv32-benchmarks-customtoolchain/src/st/st-instr.json",
"./riscv32-benchmarks-customtoolchain/src/nettle-aes/nettle-aes-instr.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/crc32-instr2.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/st-instr.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/tarfind-instr.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/huffbench-instr.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/nettle-aes-instr.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/primecount-instr.json",
"./riscv32-benchmarks-customtoolchain/src/crc32/crc32-instr.json",
"./riscv32-benchmarks-customtoolchain/src/qrduino/qrduino-instr.json",
"./riscv32-benchmarks-customtoolchain/src/minver/minver-instr.json",
"./riscv32-benchmarks-customtoolchain/src/cubic/cubic-instr.json",
"./riscv32-benchmarks-customtoolchain/src/tarfind/tarfind-instr.json",
"./riscv32-benchmarks-customtoolchain/src/nbody/nbody-instr.json",
"./riscv32-benchmarks-customtoolchain/src/wikisort/wikisort-instr.json",
"./riscv32-benchmarks-customtoolchain/src/edn/edn-instr.json",
"./riscv32-benchmarks-customtoolchain/src/picojpeg/picojpeg-instr.json",
"./riscv32-benchmarks-customtoolchain/src/aha-mont64/aha-mont64-instr.json",
"./riscv32-benchmarks-customtoolchain/src/tarfind/tarfind-instr.json",
"./riscv32-benchmarks-customtoolchain/src/nettle-sha256/nettle-sha256-instr.json",
"./riscv32-benchmarks-customtoolchain/src/nsichneu/nsichneu-instr.json",
"./riscv32-benchmarks-customtoolchain/src/statemate/statemate-instr.json"]

for fn in filenames:
	try:
		parse(fn)
	except:
		continue
