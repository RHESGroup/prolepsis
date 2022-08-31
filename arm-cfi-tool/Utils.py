import enum
import random
import label_generator
all_jump = ['b', 'bl', 'beq', 'bne', 'b.w', 'bls', 'blt', 'b.n', 'bmi', 'bx', 'bpl', 'bcc', 'bhi', 'ble',
                         'bge', 'bgt', 'bcs', 'bvc', 'blx','bleq']
cond_jmp = ['cbnz', 'cbz']
indirect = ['blx', 'bx', 'tbb', 'tbh']

direct_jmp = ['bl', 'b', 'b.w', 'b.n','bleq']
operation = ['add', 'adds', 'adds.w', 'add.w', 'adc', 'adcs', 'sub', 'sub.w', 'subs', 'subs.w', 'sbc',
                          'rsb', 'mul', 'muls', 'div', 'udiv', 'lsl', 'lsl.w', 'lsls', 'lsr', 'lsrs', 'ror', 'rrx']
logic_instr = ['and', 'and.w', 'ands.w', 'bic', 'bic.w', 'orr', 'orrs', 'orr.w', 'eor', 'eor.w', 'orn',
                            'orn.w', 'orns.w' 'mvn', 'mvn.w', 'mwns.w']


# creating enumerations using class
class EdgeType(enum.Enum):
    forward = 1
    backward = 2
def getPosFromAddress(temp,code,address):
    #addrToString = hex(address).split("0x")[1]
    pos = temp.index(address)
    return pos

class MultipleForwardEdges:
    def __init__(self, source_addr, dest_addr=None):
        self.source_addr = source_addr
        self.dest_addrs = []
        self.dest_addrs.append(dest_addr)
    def addEdge(self,dest_addr):
        if dest_addr not in self.dest_addrs:
            self.dest_addrs.append(dest_addr)

    def getEdges(self):
        return list(map(lambda x:[hex(self.source_addr),hex(x)],self.dest_addrs))

    def getAddrs(self):
        l = [self.source_addr]
        l.extend(self.dest_addrs)
        return list(dict.fromkeys(l)) #remove duplicates and return list with no duplicates
    # def getBlocks(self):
    #     l = [self.source_addr]
    #     l.extend(self.dest_addrs)
    #     return list(dict.fromkeys(l)) #remove duplicates and return list with no duplicates
    def toString(self):
        str = "forward edges from source %s" % self.source_addr
        for dest_addr in self.dest_addrs:
            str += "source %s -> dest %s\n"%(self.source_addr,dest_addr)
        return str

class MultipleBackwardEdges:
    def __init__(self, source_addr, dest_addr,caller_call_addr):
        self.source_addr = source_addr
        self.callerAndRet_addrs = []
        self.callerAndRet_addrs.append({"caller_addr":caller_call_addr,"dest_addr":dest_addr})

    def addEdge(self,dest_addr,caller_addr):
        if dest_addr not in [d["dest_addr"] for d in self.callerAndRet_addrs] \
                and dest_addr != self.source_addr:
            self.callerAndRet_addrs.append({"caller_addr":caller_addr,"dest_addr":dest_addr})

    def getEdges(self):
        return list(map(lambda x:[hex(self.source_addr),hex(x["dest_addr"])],self.callerAndRet_addrs))

    def getAddrs(self):
        l = [self.source_addr]
        for d in self.callerAndRet_addrs:
            l.extend(list(d.values()))
        return list(dict.fromkeys(l))
    #
    # def getBlocks(self):
    #     l = [self.source_addr]
    #     for d in self.callerAndRet_addrs:
    #         l.extend(list(d.values()))
    #     return list(dict.fromkeys(l))  # remove duplicates and return list with no duplicates

    def toString(self):
        str = "backward edges from source %s\n" % self.source_addr

        for i in self.callerAndRet_addrs:
            str += "source_addr: %s -> {caller_addr: %s, dest_addr: %s}\n"%(self.source_addr,
                  i["caller_addr"],
                  i["dest_addr"])
        return str
#
# def isIndirectCall(basicBlockCall):
#     lastInstruction = basicBlockCall.disassembly.insns[-1]
#
#     if lastInstruction.mnemonic in indirect:
#         return True
#     else:
#         return False

def addForwardEdge(edgesMap,source_addr,dest_addr):
    if source_addr in list(edgesMap.keys()):
        edgesMap[source_addr].addEdge(dest_addr)
    else:
        edgesMap[source_addr] = MultipleForwardEdges(source_addr,dest_addr)

def addBackwardEdge(edgesMap,source_addr,dest_addr,caller_addr):
    if source_addr in list(edgesMap.keys()):
        edgesMap[source_addr].addEdge(dest_addr,caller_addr)
    else:
        edgesMap[source_addr] = MultipleBackwardEdges(source_addr,dest_addr,caller_addr)

def printEdgesMap(edgesMap):
    for v in list(edgesMap.values()):
        print(v.toString())

def createLabelMap_PLA(edgesMap):
    l = []
    labelMap = {}
    for k,v in edgesMap.items():
        l.extend(v.getEdges())
    srcs, dsts, config_mem_words = label_generator.generate_labels(l,13)

    for k,v in srcs.items():
        labelMap[int(k,16)] = v

    for k,v in dsts.items():
        labelMap[int(k,16)] = v
    return labelMap, config_mem_words

def createLabelMap_random(edgesMap):
    l = []
    for k,v in edgesMap.items():
        l.append(k)
        l.extend(v.getAddrs())

    labelMap = dict.fromkeys(l)

    for k in labelMap:
        r = generateValidRandom(labelMap)
        labelMap[k] = r
    return labelMap

def generateValidRandom(labelMap):
    while 1:
        r = random.randint(1,2**13)
        if r not in labelMap.values():
            break
    return r
