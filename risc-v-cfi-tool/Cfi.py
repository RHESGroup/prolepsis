import re
import fileinput

import Protection
from Protection import *
import time
from munch import *
import monkeyhex
import json
import logging
from Utils import *
from typing import *
#guardare start_analysis (che lo fa solo della prima funzione e poi fa ricorsiva) recursive_analysis
#qua dentro devo trovare un modo per associare punto di partenza e punto di arrivo.


try:
    import r2pipe
except ImportError:
    print("r2pipe not found")
    print("You can install it with pip: pip install r2pipe")
    raise ImportError("r2pipe not found")

edgesMap = {}
labelMap = {}
fpgaBounds = {"start": 0x60000000 ,"end": 0x6000ffff}
r2 = None
functions = None
text_section = None

def isInTextSection(func):
    func_extremes = {"low":func.offset,"high":func.offset+func.size}
    if func_extremes["low"] >= text_section["low"] and func_extremes["high"] <= text_section["high"]:
        return True
    else:
        return False

def isAddrInFunc(addr,func):
    if (addr > func.offset or addr == func.offset) and addr < func.offset+func.size:
        return True
    else:
        return False

def isIndirectCall(addr):
    out = r2.cmdJ("pdj 1 @ %d"%addr)[0]
    out = r2.cmdJ("pdj 1 @ %d" % addr)[0]
    if out.type == "rcall":
        return True
    else:
        return False

def resolveIllegal(op):
    if op.type=="ill":
        r2.cmd("pd 1 @ %d"%op.offset)
        r2.cmd("pd 1 @ %d" % op.offset)
        resolved_op  = r2.cmdJ("pdj 1 @ %d" % op.offset)
        resolved_op = r2.cmdJ("pdj 1 @ %d" % op.offset)[0]
        return resolved_op
    else:
        return op

def isRASaved(disass):
    l = list(filter(lambda x: (x.type=="store" or x.type=="push")
                                   and "ra" in x.opcode,disass.ops))
    if len(l) == 0:
        return False
    else:
        return True

def getFunctionFromAddr(addr):
    out = r2.cmdJ("pdfj @ %s"%addr)
    out = r2.cmdJ("pdfj @ %s" % addr)
    if out == None:
        raise ValueError("function not found at address %s"%addr)
    func = list(filter(lambda x: x.name == out.name, functions))[0]
    return func

def getCallersRecursive(func,callersAndrets):
    if "codexrefs" in dir(func):
        callersAndrets.extend(map(lambda x: {"caller": x.addr, "ret": getReturnFromCaller(x.addr)},
                                  list(filter(lambda x: x.type == 'CALL' and x.at == func.offset,
                                              func.codexrefs))))
        jumps = list(filter(lambda x: x.type != 'CALL' and x.at == func.offset and not isAddrInFunc(x.addr,func),
                            func.codexrefs))
        for j in jumps:
            try:
                getCallersRecursive(getFunctionFromAddr(j.addr), callersAndrets)
            except ValueError as ve:
                print(ve)

def getReturnFromCaller(caller):
    r2.cmd("pd 2 @ %d"%caller)
    r2.cmd("pd 2 @ %d" % caller)
    out = r2.cmdJ("pdj 2 @ %d" % caller)
    out = r2.cmdJ("pdj 2 @ %d" % caller)
    if (out[1].offset - caller) >= 4:
        return out[1].offset
    else:
        return caller+4

def replaceIfMatch(old_func,new_func):
    if old_func.offset == new_func.offset:
        return new_func
    else:
        return old_func

def getCallSites(func):
    disass = r2.cmdJ("pdfj @ %s" % func.name)
    disass = r2.cmdJ("pdfj @ %s" % func.name)
    call_sites = list(filter(lambda x: x.type == "call",disass.ops))
    return call_sites

def getFuncFromOffset(funcs,offset):
    l = list(filter(lambda x: x.offset == offset,funcs))
    if len(l) > 0:
        return l[0]
    else:
        return None

def getCallersAndRets(func):
    callersAndrets = []
    if "codexrefs" not in dir(func):
        return []
    callersAndrets.extend(map(lambda x: {"caller":x.addr,"ret":getReturnFromCaller(x.addr)},
        list(filter(lambda x: x.type=='CALL' and x.at == func.offset,
                               func.codexrefs))))
    jumps = list(filter(lambda x: x.type!='CALL' and x.at == func.offset and not isAddrInFunc(x.addr,func),
                               func.codexrefs))
    for j in jumps:
        try:
            getCallersRecursive(getFunctionFromAddr(j.addr),callersAndrets)
        except ValueError as ve:
            print(ve)

    return callersAndrets

class Cfi:
    dest_jmp: Dict[str, str]
    code: Dict[str, str]
    jmp_map: Dict[str, str]
    all_jump: List[str]
    cond_jump: List[str]
    indirect: List[str]
    direct_jmp: List[str]
    data_map: Dict[str, str]
    report: bool

    def __init__(self, file_elf, report):
        self.sections = dict()
        self.data = dict()
        self.code = dict() #chiave primaria indirizzo istruzione, valore è l'istruzione in se
        self.all_jump = ['j','jal','jalr','jump']
        self.cond_jmp = ['beqz','beq','blez','bgez','ble','bleu','bge','bgeu','bltz','bgtz','blt','bltu','bgt','bgtu','bnez','bne']
        self.indirect = ['jalr','jr']
        self.direct_jmp = ['jal', 'j','jump']
        self.r2 = r2pipe.open(file_elf)
        self.file_elf=file_elf
        global filename
        filename = file_elf

    def start(self, datafilename, filename,types,outputfile=None,outputfileassembly=None):
        if outputfile == None:
            outputfile = "data"
        if outputfileassembly == None:
            outputfileassembly = "mod_asm"
        Protection.types = types
        config_init = types["config_init"]
        init_function_name = types["init_function_name"]
        print("[+] Convert " + filename + " into assembly file\n")
        t1 = time.perf_counter()
        self.get_assembly_2(filename) #crea il assembly lasciando solo le istruzioni
        print(time.perf_counter() - t1)
        self.get_data(datafilename)
        global r2
        r2 = r2pipe.open(self.file_elf)
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

        global functions
        functions = r2.cmdJ("aflj")
        functions = r2.cmdJ("aflj")
        '''
        for f in functions:
            call_sites = getCallSites(f)
            for call_site in call_sites:
                target_offset = int(re.findall(r"0x[0-9a-f]{1,8}",call_site.opcode)[0],16)
                if target_offset == None:
                    continue
                target_func = getFuncFromOffset(functions,target_offset)
                target_func_dict = target_func._asdict()
                if "codexrefs" in target_func_dict:
                    target_func_dict["codexrefs"] = list((map(lambda x: x._asdict(), (list(filter(
                        lambda x: x.type != "CALL",
                        target_func_dict["codexrefs"]))))))
                else:
                    target_func_dict["codexrefs"] = []
                target_func_dict["codexrefs"].append({'addr':call_site.offset,'at':target_offset,'type':'CALL'})
                target_func_modified = r2pipe.open_base.jo2po(json.dumps(target_func_dict))
                functions = list(map(lambda x: replaceIfMatch(x,target_func_modified),functions))
        '''
        global text_section
        sections = r2.cmdJ("iSj")
        sections = r2.cmdJ("iSj")
        t_section = list(filter(lambda x: x.name == ".text", sections))[0]
        text_section = {"low": t_section.vaddr, "high": t_section.vaddr + t_section.vsize}

        for f in list(filter(lambda x: "IRQHandler" not in x.name and isInTextSection(x), functions)):
            disass = r2.cmdJ("pdfj @ %s" % f.name)
            disass = r2.cmdJ("pdfj @ %s" % f.name)
            #resolved = list(map(lambda x: resolveIllegal(x),disass.ops))
            #disass = disass._replace(ops=resolved)
            # adding forward edges
            indirect_call_site_addresses = list(filter(lambda x: x.type == "rcall", disass.ops))
            for call_site_addr in indirect_call_site_addresses:
                if "refs" in dir(call_site_addr):
                    for target in list(map(lambda x: x.addr,
                                           list(filter(lambda x: x.type == "CALL", call_site_addr.refs)))):
                        addForwardEdge(edgesMap, call_site_addr.offset, target)

            # adding backward edges only if return address is saved in memory
            if "codexrefs" in dir(f) and isRASaved(disass):
                return_site_addresses = list(filter(lambda x: x.type == "ret", disass.ops))
                callerAndRets = getCallersAndRets(f)
                for ret_site_addr in return_site_addresses:
                    for cr in callerAndRets:
                        addBackwardEdge(edgesMap, ret_site_addr.offset, cr["ret"], cr["caller"])
        labelMap = ""
        config_mem_words = ""
        try:
            labelMap, config_mem_words = createLabelMap_PLA(edgesMap)
        except Exception as e:
            print(f"[-] failed in generating labels with createLabelMap_PLA strategy. Error {e}")
            print("[*] defaulting to createLabelMap_random")
            labelMap = createLabelMap_random(edgesMap)
            config_mem_words = [0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0]
            
        config_mem_words = list(map(lambda x: str(x)+"\n",config_mem_words))
        file = open(f"{filename}_config_mem_words.txt","w")
        file.writelines(config_mem_words)
        print(f"configuration words written to {filename}_config_mem_words.txt")
        #
        # print(labelMap)
        # printEdgesMap(edgesMap)

        file = open("out-2.s", 'r')
        lines = file.readlines()
        temp = list(self.code)

        print("instrumenting forward edges...")
        #start instrumentation process for forward edges
        for forwardEdges in [e for e in edgesMap.values() if type(e) == MultipleForwardEdges]:

            if len(forwardEdges.dest_addrs) > 1:
                source_addr = forwardEdges.source_addr
                # source_pos = getPosFromAddress(temp, self.code, source_addr)
                type_1(self.code, source_addr, Location.source, labelMap[forwardEdges.source_addr])

                for dest_addr in forwardEdges.dest_addrs:
                    # dest_pos = getPosFromAddress(temp, self.code, dest_addr)

                    type_1(self.code, dest_addr, Location.dest, labelMap[dest_addr])

            elif len(forwardEdges.dest_addrs) == 1:
                dest_addr = forwardEdges.dest_addrs[0]
                source_addr = forwardEdges.source_addr

                # source_pos = getPosFromAddress(temp,self.code,source_addr)
                # dest_pos = getPosFromAddress(temp,self.code,dest_addr)

                type_1(self.code, source_addr, Location.source, labelMap[forwardEdges.source_addr])
                type_1(self.code, dest_addr, Location.dest, labelMap[dest_addr])
        print("forward edges instrumented successfully.")
        # start instrumentation process for backward edges
        print("instrumenting backward edges...")

        for backwardEdges in [e for e in edgesMap.values() if type(e) == MultipleBackwardEdges]:

            if len(backwardEdges.callerAndRet_addrs) > 1:
                source_addr = backwardEdges.source_addr
                # source_pos = getPosFromAddress(temp, self.code, source_addr)
                type_1(self.code, source_addr, Location.source, labelMap[backwardEdges.source_addr])

                for callerAndRet in backwardEdges.callerAndRet_addrs:
                    dest_addr = callerAndRet["dest_addr"]
                    caller_addr = callerAndRet["caller_addr"]
                    # dest_pos = getPosFromAddress(temp, self.code, dest_addr)
                    # caller_pos = getPosFromAddress(temp, self.code, caller_addr)

                    type_1(self.code, dest_addr, Location.dest, labelMap[callerAndRet["dest_addr"]])

                    if isIndirectCall(callerAndRet["caller_addr"]):
                        replaceWithType7(self.code, caller_addr, labelMap[callerAndRet["dest_addr"]])
                    else:
                        type_5(self.code, caller_addr, labelMap[callerAndRet["dest_addr"]])

            elif len(backwardEdges.callerAndRet_addrs) == 1:
                source_addr = backwardEdges.source_addr
                dest_addr = backwardEdges.callerAndRet_addrs[0]["dest_addr"]
                caller_addr = backwardEdges.callerAndRet_addrs[0]["caller_addr"]

                # source_pos = getPosFromAddress(temp,self.code,source_addr)
                # dest_pos = getPosFromAddress(temp,self.code,dest_addr)
                # caller_pos = getPosFromAddress(temp,self.code,caller_addr)

                type_1(self.code, source_addr, Location.source, labelMap[backwardEdges.source_addr])
                type_1(self.code, dest_addr, Location.dest,
                       labelMap[backwardEdges.callerAndRet_addrs[0]["dest_addr"]])

                if isIndirectCall(backwardEdges.callerAndRet_addrs[0]["caller_addr"]):
                    replaceWithType7(self.code, caller_addr,
                                     labelMap[backwardEdges.callerAndRet_addrs[0]["dest_addr"]])
        print("backward edges instrumented successfully.")
        print("instrumenting IRQHandlers...")

        #start instrumentation of IRQHandlers

        for f in list(filter(lambda x: "IRQHandler" in x.name and isInTextSection(x), functions)):
            # start_pos = getPosFromAddress(temp, self.code, func.offset)
            disass = r2.cmdJ("pdfj @ %s" % f.name)
            disass = r2.cmdJ("pdfj @ %s" % f.name)
            #resolved = list(map(lambda x: resolveIllegal(x), disass.ops))
            #disass.ops = resolved
            return_site_addresses = list(filter(lambda x: x.type == "ret", disass.ops))
            if len(return_site_addresses) > 0:
                type_8(self.code, f.offset)
                # for ret_pos in list(map(lambda x: getPosFromAddress(temp,self.code,x.offset),
                #                         return_site_addresses)):
                for ret_addr in list(map(lambda x: x.offset, return_site_addresses)):
                    type_9(self.code, ret_addr)

        print("IRQHandlers instrumented successfully.")

        lines = list(self.code.values())
        #lines[0] = f"\t.text\n\nentrypoint:\n{config_init}j {init_function_name}\n\n" + lines[0]
        lines[0] = "\t.text\n\t.globl  main\n\t.type  main, @function\n\n" + lines[0]
        for l in self.sections.values():
            if ".rodata" in l[0]:
                l[0] = l[0].replace(".rodata", ".section .rodata")
                if ".rodata" in l[1]:
                    l[1] = l[1].replace(".rodata","start_rodata")
            for i in range(len(l)):
                if "-0x" in l[i]:
                    l[i] = l[i].replace("-0x","_")
            lines.extend(l)

        print("writing instrumented assembly to %s.s..." % outputfileassembly)
        f2 = open("%s.s" % outputfileassembly, 'w')
        f2.writelines(lines)
        f2.close()
        print("instrumented assembly successfully written to %s.s" % outputfileassembly)

        print("writing edges with labels to %s.json..."%outputfile)
        json_out = []
        for e in edgesMap.values():
            json_elem ={}
            if type(e) == MultipleForwardEdges:
                json_elem["type"] = "forward"
                json_elem["source"] = {"source_addr":
                                           hex(e.source_addr),
                                       "source_label":labelMap[e.source_addr]}
                json_elem["destinations"] = list(map(lambda dest_addr: {
                    "dest_addr": hex(dest_addr),
                "dest_label":labelMap[dest_addr]},e.dest_addrs))

            elif type(e) == MultipleBackwardEdges:
                json_elem["type"] = "backward"
                json_elem["source"] = {
                    "source_addr": hex(e.source_addr),
                    "source_label":labelMap[e.source_addr]
                }
                json_elem["destinations"] = list(map(
                    lambda callerAndRet_addr: {"dest_addr": hex(callerAndRet_addr["dest_addr"]),
                                             "dest_label": labelMap[callerAndRet_addr["dest_addr"]],
                                             "caller_addr":hex(callerAndRet_addr["caller_addr"]),
                                             "caller_label": labelMap[callerAndRet_addr["dest_addr"]]}
                                    ,e.callerAndRet_addrs))
            json_out.append(json_elem)

        with open(outputfile+'.json', 'w') as f:
            json.dump(json_out, f)

        print("edges with labels successfully written to %s.json"%outputfile)

        print("backward instructions")
        for e in edgesMap.values():
            if type(e) == MultipleBackwardEdges:
                print("%s: %s"%(hex(e.source_addr),r2.cmdJ(f"pdj 1 @ {e.source_addr}")[0].disasm))

    def get_data(self,filename):
        with open(filename,"r") as f:
            lines = f.readlines()
            f.close()
        lines = list(map(lambda x: x.strip(), lines))
        current_section=""
        for i,l in enumerate(lines):
            if "file format" in l:
                continue
            elif "Disassembly" in l:
                section_name = re.findall(r"Disassembly of section (\..*):", l)[0]
                self.sections[section_name] = [f"\n\n\t{section_name}\n\n"]
                current_section = section_name
            elif l == "":
                continue
            # elif l=="...":
            #     try:
            #         next_line = lines[i+1]
            #         prev_line = lines[i-1]
            #         m_next = re.match(r"^([0-9a-z]{1,8}):\t([0-9a-f ]*)\t(.*)", next_line)
            #         m_prev = re.match(r"^([0-9a-z]{1,8}):\t([0-9a-f ]*)\t(.*)", prev_line)
            #         n_bytes = int(re.findall(r"([0-9]{1,8})byte", m_prev.groups()[2])[0])
            #         start = int(m_prev.groups()[0],16)
            #         end = int(m_next.groups()[0],16)
            #         start = start + n_bytes
            #         iterations = (end - start) / n_bytes
            #         self.sections[current_section].extend([f"\t{m_prev.groups()[2]}\n" for i_2 in range(int(iterations))])
            #     except:
            #         continue
            elif re.match(r"^([0-9a-z]{8}) <(.*)>:", l):
                m = re.match(r"^([0-9a-z]{8}) <(.*)>:", l)
                self.sections[current_section].append(m.groups()[1]+":\n")
                self.data[int(m.groups()[0],16)] = f"{m.groups()[1]}:\n"
            elif re.match(r"^([0-9a-z]{1,8}):\t([0-9a-f ]*)\t(.*)",l):
                m = re.match(r"^([0-9a-z]{1,8}):\t([0-9a-f ]*)\t(.*)",l)
                opcode = m.groups()[1].replace(" ","").replace("\t","")
                addr = int(m.groups()[0],16)
                remaining = m.groups()[2]
                if not re.match(r"\.[0-9]{0,8}byte.*",remaining):
                    self.sections[current_section].append(f"\t.4byte\t0x{opcode}\n")
                    if addr not in self.data.keys():
                        self.data[addr] = f"\t.4byte\t0x{opcode}\n"
                    else:
                        self.data[addr] = self.data[addr] + f"\t.4byte\t0x{opcode}\n"
                else:
                    self.sections[current_section].append(f"\t{remaining}\n")
                    if addr not in self.data.keys():
                        self.data[addr] = f"\t{remaining}\n"
                    else:
                        self.data[addr] = self.data[addr] + f"\t{remaining}\n"
                # self.sections[current_section].append(f"\t.word\t0x{word}\n")
                # if addr not in self.data.keys():
                #     self.data[addr] = f"\t.word\t0x{word}\n"
                # else:
                #     self.data[addr] =self.data[addr] + f"\t.word\t0x{word}\n"

    def get_assembly_2(self,filename):
        with open(filename,"r") as f:
            lines = f.readlines()
            f.close()
        lab_number = 0
        lab_maps = {}
        lines = list(map(lambda x: x.strip(),lines))
        for l in lines:
            #beginning of function
            if "file format" in l:
                continue
            elif "Disassembly" in l:
                continue
            elif l == "":
                continue
            elif re.match(r"^([0-9a-z]{8}) <(.*)>:", l):
                m = re.match(r"^([0-9a-z]{8}) <(.*)>:", l)
                self.code[int(m.groups()[0],16)] = m.groups()[1]+":\n"

            elif re.match(r"^([0-9a-z]{1,8}):\s+([0-9a-z]{1}[0-9a-z ]{1,7}[0-9a-z]{1})\s+(.*)",l):
                m = re.match(r"^([0-9a-z]{1,8}):\s+([0-9a-z]{1}[0-9a-z ]{1,7}[0-9a-z]{1})\s+(.*)",l)
                addr = m.groups()[0]
                instr = m.groups()[2]
                op = instr.split()[0]
                if (op.split(".")[0] in self.all_jump or op.split(".")[0] in self.cond_jmp) \
                        and op.split(".")[0] not in self.indirect:
                    target_lab = re.findall("<(.*)>",instr)[0]
                    if "+0x" not in target_lab:
                        target_addr = re.findall("([0-9a-z]{1,8}) <",instr)[0]
                        instr = instr.replace(target_addr, target_lab)
                        instr = instr[0:instr.find(target_lab) + len(target_lab)]
                        # if instr.find(";") != -1:
                        #     instr = instr[0:instr.find(";")]
                        if int(addr,16) not in self.code.keys():
                            self.code[int(addr,16)] = "\t"+instr+"\n"
                        else:
                            self.code[int(addr,16)] += "\t"+instr+"\n"
                    else:
                        target_addr = re.findall("([0-9a-z]{1,8}) <",instr)[0]
                        if target_addr in lab_maps.keys():
                            instr = instr.replace(target_addr, f"lab{lab_maps[target_addr]}")
                            # ind = instr.find(f"lab{lab_number}")
                            instr = instr[0:instr.find(f"lab{lab_maps[target_addr]}") + len(f"lab{lab_maps[target_addr]}")]
                            if int(addr, 16) not in self.code.keys():
                                self.code[int(addr, 16)] = "\t" + instr + "\n"
                            else:
                                self.code[int(addr, 16)] += "\t" + instr + "\n"
                            # self.code[int(target_addr,16)] = f"lab{lab_maps[target_addr]}: "
                        else:
                            instr = instr.replace(target_addr,f"lab{lab_number}")
                            #ind = instr.find(f"lab{lab_number}")
                            instr = instr[0:instr.find(f"lab{lab_number}")+len(f"lab{lab_number}")]
                            if int(addr,16) not in self.code.keys():
                                self.code[int(addr,16)] = "\t"+instr+"\n"
                            else:
                                self.code[int(addr,16)] += "\t"+instr+"\n"
                            self.code[int(target_addr,16)] = f"lab{lab_number}: "
                            lab_maps[target_addr] = lab_number
                            lab_number += 1
                else:
                    # if instr.find(";") != -1:
                    #     instr = instr[0:instr.find(";")]
                    if int(addr,16) not in self.code.keys():
                        self.code[int(addr,16)] = "\t"+instr+"\n"
                    else:
                        self.code[int(addr,16)] += "\t"+instr+"\n"
        ordered = dict(sorted(self.code.items()))
        self.code = ordered
        with open("out-2.s","w") as f:
            for k,v in ordered.items():
                f.write(v)
            f.close()
