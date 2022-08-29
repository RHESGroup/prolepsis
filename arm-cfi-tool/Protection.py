import enum
import re

types = []
class Location(enum.Enum):
    source = 1
    dest = 2

def replaceWithType7(code,addr,label):
    '''append_txt_type1 = "\t" + "cpsid f" + "\n\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                         "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2, #0]" + "\n\t" \
                         + "pop {r1, r2}"'''
    append_txt_type1 = types["type1"]["before"].replace("<REPLACEWITHLABEL>", str(label))
    '''append_txt_type2 = "\t" + "cpsid f" + "\n\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                     "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2,#6]" + "\n\t" \
                           + "pop {r1, r2}" '''
    append_txt_type2 = types["type2"]["before"].replace("<REPLACEWITHLABEL>", str(label))
    '''append_txt_type7 = "\t" + "\n\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                 "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2,#8]" + "\n\t" \
                 + "POP {r1, r2}"'''
    append_txt_type7 = types["type7"].replace("<REPLACEWITHLABEL>", str(label))
    if code[addr].find(append_txt_type1) != 1:
        code[addr] = code[addr].replace(append_txt_type1,append_txt_type7)
    elif code[addr].find(append_txt_type2) != 1:
        code[addr] = code[addr].replace(append_txt_type2, append_txt_type7)


def type_1(code, addr, location, label):
    # type 1
    # before jmp
    if location == Location.source:
        '''append_txt = "\t" + "cpsid f" + "\n\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                             "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2, #0]" + "\n\t" \
                             + "pop {r1, r2}" + "\n" '''
        append_txt = types["type1"]["before"].replace("<REPLACEWITHLABEL>", str(label))
        if append_txt in code[addr]:
            return
        if re.match(r"(.*:)",code[addr]):
            m = re.match(r"(.*:)", code[addr])
            index = m.start() + len(m.group())
            code[addr] = code[addr][:index] + append_txt + code[addr][index:]
        else:
            code[addr] = append_txt + code[addr]
    elif location == Location.dest:
        # after_jmp
        append_txt = "\t" + "push{r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + "\n\t" + \
                     "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2, #2]" + "\n\t" \
                     + "pop {r1, r2}" + "\n\t" + "cpsie f" + "\n"
        append_txt = types["type1"]["after"].replace("<REPLACEWITHLABEL>", str(label))
        if append_txt in code[addr]:
            return
        if re.match(r"(.*:)",code[addr]):
            m = re.match(r"(.*:)", code[addr])
            index = m.start() + len(m.group())
            code[addr] = code[addr][:index] + append_txt + code[addr][index:]
        else:
            code[addr] = append_txt + code[addr]
    code[addr] = code[addr].replace("\n\n","\n")

def type_2(code, addr, location, label):
    # type 2
    # before jmp
    if location == Location.source:
        append_txt = "\t" + "cpsid f" + "\n\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                     "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2,#6]" + "\n\t" \
                     + "pop {r1, r2}" + "\n"
        append_txt = types["type2"]["before"].replace("<REPLACEWITHLABEL>", str(label))
        if append_txt in code[addr]:
            return
        if re.match(r"(.*:)",code[addr]):
            m = re.match(r"(.*:)", code[addr])
            index = m.start() + len(m.group())
            code[addr] = code[addr][:index] + append_txt + code[addr][index:]
        else:
            code[addr] = append_txt + code[addr]
        code[addr] = code[addr].replace("\n\n", "\n")
    elif location == Location.dest:
        # after_jmp
        append_txt = "\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + "\n\t" + \
                     "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2, #2]" + "\n\t" \
                                                                                           "pop {r1, r2}" + "\n\t" + "cpsie f" + "\n"
        append_txt = types["type2"]["after"].replace("<REPLACEWITHLABEL>", str(label))
        if append_txt in code[addr]:
            return
        if re.match(r"(.*:)", code[addr]):
            m = re.match(r"(.*:)", code[addr])
            index = m.start() + len(m.group())
            code[addr] = code[addr][:index] + append_txt + code[addr][index:]
        else:
            code[addr] = append_txt + code[addr]
        code[addr] = code[addr].replace("\n\n", "\n")


def type_5(code, addr, label):

    # type 5
    # before jmp
    append_txt = "\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                 "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2,#4]" + "\n\t" \
                                                                                               "pop {r1, r2}" + "\n"
    append_txt = types["type5"].replace("<REPLACEWITHLABEL>", str(label))
    if append_txt in code[addr]:
        return
    if re.match(r"(.*:)", code[addr]):
        m = re.match(r"(.*:)", code[addr])
        index = m.start() + len(m.group())
        code[addr] = code[addr][:index] + append_txt + code[addr][index:]
    else:
        code[addr] = append_txt + code[addr]
    code[addr] = code[addr].replace("\n\n", "\n")

def type_7(code, addr, label):
    # type 7
    # before jmp
    append_txt = "\t" + "\n\t" + "push {r1, r2}" + "\n\t" + "mov.w r1, #" + str(label) + \
                 "\n\t" + "mov.w r2, #1610612736 ; 0x60000000" + "\n\t" + "strh r1, [r2,#8]" + "\n\t" \
                 + "POP {r1, r2}" + "\n"
    append_txt = types["type7"].replace("<REPLACEWITHLABEL>", str(label))

    code[addr] = append_txt + code[addr]


def type_8(code, addr):
    # type 8
    # before execute isr call
    '''
    append_txt = "\t" + "stmdb sp!, {r7, r8, r9}" + "\n\t" + "mov.w	r8, #0" + "\n\t" + "strh.w	r0, [r8, #10]" + \
                     "\n\t" + "mov.w	r7, r0, lsr #16" + "\n\t" + "strh.w	r7, [r8, #10]" + "\n\t" \
                     + "strh.w	r1, [r8, #10]" + "\n\t" + "mov.w	r7, r1, lsr #16" + "\n\t" + "strh.w	r7, [r8, #10]" \
                     + "\n\t" + "strh.w	r2, [r8, #10]" + "\n\t" + "mov.w	r7, r2, lsr #16" + "\n\t" \
                     + "strh.w	r7, [r8, #10]" + "\n\t" + "strh.w	r3, [r8, #10]" + "\n\t" \
                     + "mov.w	r7, r3, lsr #16" + "\n\t" + "strh.w	r7, [r8, #10]" + "\n\t" + "strh.w	ip, [r8, #10]" \
                     + "\n\t"  + "mov.w	r7, ip, lsr #16" + "\n\t" + "strh.w	r7, [r8, #10]" + "\n\t" +\
                     "strh.w	lr, [r8, #10]" + "\n\t" + "mov.w	r7, lr, lsr #16" + "\n\t" + "strh.w	r7, [r8, #10]" \
                     +"\n\t" + "ldr	r7, [sp, #36]	; 0x24" + "\n\t" + "strh.w	r7, [r8, #10]" + "\n\t" +\
                     "mov.w	r9, r7, lsr #16" + "\n\t" + "strh.w	r7, [r8, #10]" + "\n\t" + "ldr	r7, [sp, #40]	; 0x28"\
                     + "\n\t" + "strh.w	r7, [r8, #10]" + "\n\t" + "mov.w	r9, r7, lsr #16" + "\n\t" +\
                     "strh.w	r7, [r8, #10]" + "\n\t" + "ldmia.w	sp!, {r7, r8, r9}" + "\n"
    '''
    append_txt = types["type8"]
    m = re.match(r"(.*:)", code[addr])
    index = m.start() + len(m.group())
    code[addr] = code[addr][:index] + append_txt + code[addr][index:]
    code[addr] = code[addr].replace("\n\n","\n")

def type_9(code, addr):
    #  type 9
    # return isr call
    # before execute isr call
    '''
    append_txt = "\t" + "stmdb	sp!, {r7, r8, r9}" + "\n\t" + "mov.w	r8, #1610612736	; 0x60000000" +\
                      "\n\t" + "ldr	r7, [sp, #40]	; 0x28" + "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + \
                      "mov.w	r9, r7, lsr #16" + "\n\t" + "strh.w	r7, [r8, #12]" + \
                      "\n\t" + "ldr	r7, [sp, #36]	; 0x24" + "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + \
                      "mov.w	r9, r7, lsr #16" + "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + "ldr	r7, [sp, #32]" + \
                      "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + "mov.w	r9, r7, lsr #16" + "\n\t" + \
                      "strh.w	r7, [r8, #12]" + "\n\t" + "ldr	r7, [sp, #28]" + "\n\t"  + "strh.w	r7, [r8, #12]" + \
                      "\n\t" + "mov.w	r9, r7, lsr #16" + "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + \
                      "ldr	r7, [sp, #24]" + "\n\t" + "strh.w	r7, [r8, #12]" +"\n\t" + "mov.w	r9, r7, lsr #16" + \
                      "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + "ldr	r7, [sp, #20]" + "\n\t" + \
                      "strh.w	r7, [r8, #12]" + "\n\t" + "mov.w	r9, r7, lsr #16" + "\n\t" + "strh.w	r7, [r8, #12]" +\
                      "\n\t" + "ldr	r7, [sp, #16]" + "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + \
                      "mov.w	r9, r7, lsr #16" + "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + "ldr	r7, [sp, #12]" + \
                      "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + "mov.w	r9, r7, lsr #16" + \
                      "\n\t" + "strh.w	r7, [r8, #12]" + "\n\t" + "ldmia.w	sp!, {r7, r8, r9}" + "\n"
    '''
    append_txt = types["type9"]
    if re.match(r"(.*:)", code[addr]):
        m = re.match(r"(.*:)", code[addr])
        index = m.start() + len(m.group())
        code[addr] = code[addr][:index] + append_txt + code[addr][index:]
    else:
        code[addr] = append_txt + code[addr]
    code[addr] = code[addr].replace("\n\n", "\n")

