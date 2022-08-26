import r2pipe
import sys

def isInTextSection(func):
    func_extremes = {"low":func.offset,"high":func.offset+func.size}
    if func_extremes["low"] >= text_section["low"] and func_extremes["high"] <= text_section["high"]:
        return True
    else:
        return False


r2 = r2pipe.open(sys.argv[1])
r2.cmd("e asm.emu=true")
r2.cmd("e asm.emu=true")
r2.cmd("e anal.jmp.ref=true")
r2.cmd("e anal.jmp.cref=true")
r2.cmd("e anal.jmp.cref=true")
r2.cmd("e anal.jmp.ref=true")
r2.cmd("e anal.cc=reg")
r2.cmd("e anal.cc=reg")
r2.cmd("aaaa")
r2.cmd("aaaa")

functions = r2.cmdJ("aflj")
functions = r2.cmdJ("aflj")

sections = r2.cmdJ("iSj")
sections = r2.cmdJ("iSj")
t_section = list(filter(lambda x: x.name == ".text", sections))[0]
text_section = {"low": t_section.vaddr, "high": t_section.vaddr + t_section.vsize}

sum=0
for f in list(filter(lambda x: "IRQHandler" not in x.name and isInTextSection(x), functions)):
	disass = r2.cmdJ("pdfj @ %s" % f.name)
	disass = r2.cmdJ("pdfj @ %s" % f.name)
	calls = list(filter(lambda x: "call" in x.type, disass.ops))
	jumps = list(filter(lambda x: "jmp" in x.type, disass.ops))
	sum+=(len(calls)*2)
	sum+=len(jumps)

print(f"total edges for {sys.argv[1]}: {sum}")

