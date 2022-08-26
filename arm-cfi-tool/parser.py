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
	
	
filenames = ["./arm-benchmarks/src/matmult-int/matmult-int-instr.json",
"./arm-benchmarks/src/slre/slre-instr.json",
"./arm-benchmarks/src/huffbench/huffbench-instr.json",
"./arm-benchmarks/src/primecount/primecount-instr.json",
"./arm-benchmarks/src/st/st-instr.json",
"./arm-benchmarks/src/nettle-aes/nettle-aes-instr.json",
"./arm-benchmarks/src/crc32/crc32-instr2.json",
"./arm-benchmarks/src/crc32/st-instr.json",
"./arm-benchmarks/src/crc32/tarfind-instr.json",
"./arm-benchmarks/src/crc32/huffbench-instr.json",
"./arm-benchmarks/src/crc32/nettle-aes-instr.json",
"./arm-benchmarks/src/crc32/primecount-instr.json",
"./arm-benchmarks/src/crc32/crc32-instr.json",
"./arm-benchmarks/src/qrduino/qrduino-instr.json",
"./arm-benchmarks/src/minver/minver-instr.json",
"./arm-benchmarks/src/cubic/cubic-instr.json",
"./arm-benchmarks/src/tarfind/tarfind-instr.json",
"./arm-benchmarks/src/nbody/nbody-instr.json",
"./arm-benchmarks/src/wikisort/wikisort-instr.json",
"./arm-benchmarks/src/edn/edn-instr.json",
"./arm-benchmarks/src/picojpeg/picojpeg-instr.json",
"./arm-benchmarks/src/aha-mont64/aha-mont64-instr.json",
"./arm-benchmarks/src/tarfind/tarfind-instr.json",
"./arm-benchmarks/src/nettle-sha256/nettle-sha256-instr.json",
"./arm-benchmarks/src/nsichneu/nsichneu-instr.json",
"./arm-benchmarks/src/statemate/statemate-instr.json"
]

for fn in filenames:
	parse(fn)
