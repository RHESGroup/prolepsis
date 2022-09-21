from Cfi import Cfi
import time
import sys
import os
import argparse
import json
SCRIPT_DESCRIPTION = "AUTOMATIC BINARY ANALYSIS AND INSTRUMENTATION PROCESS"
SCRIPT_VERSION = "0.1"
print(SCRIPT_DESCRIPTION)
print("Version " + SCRIPT_VERSION)
parser = argparse.ArgumentParser(description='Applies CFI to given firmware')
parser.add_argument('-disassembly', action='store', metavar="file.list",help='disassembly file obtained with objdump -d -j .text')
parser.add_argument('-binary', action='store', metavar="file.elf", help='binary file')
parser.add_argument('-report', action='store_true', help='turn ON generation of report')
parser.add_argument('-outputfile', action='store',
                        help='Output filename to write info related to edges and labels in JSON format')
parser.add_argument('-outputfileassembly',action='store',help='Output filename of instrumented .text section of the assembly')
parser.add_argument('-typesfile',action='store',help='JSON file defining instructions for each type of instrumentation')
parser.add_argument('-disassemblyfull',action='store',help='disassembly file obtained with objdump -D -j .rodata -j .data -j .bss')

options = parser.parse_args()

if len(sys.argv)==1:
        parser.print_help()
        sys.exit(1)


if os.path.exists(options.disassemblyfull) and os.path.exists(options.disassembly) and os.path.exists(options.binary) and os.path.exists(options.typesfile):
    binary=options.binary
    report = options.report
    filename = options.disassembly
    datafilename = options.disassemblyfull
    f = open(options.typesfile)
    types = json.load(f)
    cfi = Cfi(binary, report)
    start_time = time.time()
    cfi.start(datafilename,filename,types,options.outputfile,options.outputfileassembly)
else:
    parser.print_help()

