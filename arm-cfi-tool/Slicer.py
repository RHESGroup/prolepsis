types = ['io', 'acmp', 'add',
         'sync', 'and', 'call',
         'ccall', 'cjmp', 'mjmp',
         'cmp', 'ill', 'jmp',
         'lea', 'leave', 'load',
         'new', 'mod', 'cmov', 'mov', 'cast', 'mul', 'div', 'nop', 'not', 'null', 'or', 'pop', 'push', 'rep', 'ret', 'cret', 'rol', 'ror', 'sal', 'sar', 'shl', 'shr', 'store', 'sub', 'swi', 'cswi', 'switch', 'trap', 'ucall', 'rcall', 'icall', 'ircall', 'ucccall', 'ucjmp', 'ujmp', 'rjmp', 'ijmp', 'irjmp', 'unk', 'upush', 'rpush', 'xchg', 'xor', 'case', 'cpl', 'crypto']

interesting_types = ['add','and','load','store','cmov','mov','mul','div','not','or','rol','ror','sal','sar','shl','shr','store','sub','xor']
class Resolver:

    def __init__(self, addr, r2):
        self.paths = []
        self.finalTarget = addr
        self.r2 = r2

    def slice(self):
        out = self.r2.cmdJ("aoj @ %d"%self.finalTarget)
        reg = list(filter(lambda x: x.type=="reg",out[0].operands))[0]
        self.recursiveSlice([reg],0)
        return None

    def recursiveSlice(self,targets,addr,path_index):
        block = self.getBlockFromAddress(addr)
        self.blockSlice(block,targets,path_index)

        return None

    def getDestinationOperand(self,ins):
        try:
            return list(map(lambda x: x.value,
            list(filter(lambda x: x.type == "reg",
                        ins.operands))))[0]
        except:
            return None

    def getRegisterOperands(self,ins):
        try:
            return list(map(lambda x: x.value,
                            list(filter(lambda x: x.type == "reg",
                                        ins.operands))))
        except:
            return None


    def getSourceOperands(self,ins):
        regs = set()
        for o in ins.operands:
            if o.type == "reg":
                regs.add(o.value)
            elif o.type == "mem":
                regs.add(o.base)
        return list(regs)

    def getBlockFromAddress(self,addr):
        out=self.r2.cmdJ("agj @ %s"%addr)
        block = list(filter(lambda x: (x.offset+x.size > addr or
                          x.offset+x.size == addr) and
                         (x.offset < addr or
                          x.offset  == addr),out[0].blocks))[0]
        return block


    def blockSlice(self,block,targets,path_index):
        state = set(targets)
        for op in block.ops[:-1].reverse():
            ins = self.r2.cmdJ("aoj @ %d"%op.offset)
            if ins.type == 'push':
                self.addInstructionToPath(ins, path_index)
                self.state()
            elif self.getDestinationOperand(ins) in state and (
                ins.type in interesting_types):
                    dest = self.getDestinationOperand(ins)
                    state.remove(dest)
                    sources = self.getSourceOperands(ins)
                    state.update(sources)

    def addInstructionToPath(self,ins,index):
        if index > len(self.paths) or index == len(self.paths):
            self.paths.append([])
        self.paths[index].append(ins)