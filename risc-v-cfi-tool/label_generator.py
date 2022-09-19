from sign_generation_grouping import *
import random
import json
import sys
import math

def rec_change_src_label(literal, labels, signature, new_src_label, srcs, dsts):
    srcs[literal] = new_src_label
    for sig in labels:
        if(sig == signature):
            continue
        elif(labels[sig][0] == literal):
            new_dst_label = sig - new_src_label
            rec_change_dst_label(labels[sig][1], labels, sig, new_dst_label, srcs, dsts)
        else:
            continue

def rec_change_dst_label(literal, labels, signature, new_dst_label, srcs, dsts):
    dsts[literal] = new_dst_label
    for sig in labels:
        if(sig == signature):
            continue
        elif(labels[sig][1] == literal):
            new_src_label = sig - new_dst_label
            rec_change_src_label(labels[sig][0], labels, sig, new_src_label, srcs, dsts)
        else:
            continue

# jsonfile : json source file where edges are listed
# edges : edge table (optionally generated inside here, either you provide the jsonfile, or directly the edges)
# n : bit length of the signatures to be generated
def generate_labels(edges, n, jsonfile=""):

    sys.setrecursionlimit(10000)

    if(jsonfile != ""):
        edge_table_json = open(jsonfile)
        branches = json.load(edge_table_json)
        edges = []
        for b in branches:
            l2 = list(map(lambda x: [str(b["source"]["source_addr"]), str(x["dest_addr"])], b["destinations"]))
            edges.extend(l2)

    srcs = dict()
    dsts = dict()

    for edge in edges:
        srcs[edge[0]] = 0
        dsts[edge[1]] = 0


    sigs = len(edges) # number of edge signatures to be generated (corresponding to the number of edges, of course)

    signatures, group_indexing, challenge_indexing = gen_number(sigs, n)

    config_mem_words = bin_config_mem(group_indexing, challenge_indexing)

    labels = dict()
    i = 0

    for signature in signatures:
        labels[signature] = edges[i]
        i += 1

    # there exists 4 cases:
    # 1 we have no S or D yet: both are chosen random s.t. sum is the signature
    # 2 we have S but not D: D is chosen random s.t. sum is the signature
    # 3 we have D but not S: S is chosen random s.t. sum is the signature
    # 4 we have both S and D: problem, because you have unique signature to reach but S and D are already provided
    # Solution --> re-draw S and D s.t. XOR is the signature --> change any associated D and S in other edges
    # This creates no problem, as there is no other couple S,D s.t. sum has the same signature

    for signature in signatures:

        if(srcs[labels[signature][0]] == 0 and dsts[labels[signature][1]] == 0):
            src_label = random.randint(0, signature)
            while (src_label in srcs.values() or (signature - src_label) in dsts.values()):
                src_label = random.randint(0, signature)
            dst_label = signature - src_label

        elif(srcs[labels[signature][0]] != 0 and dsts[labels[signature][1]] == 0):
            src_label = srcs[labels[signature][0]]
            dst_label = signature - src_label

        elif(srcs[labels[signature][0]] == 0 and dsts[labels[signature][1]] != 0):
            dst_label = dsts[labels[signature][1]]
            src_label = signature - dst_label

        elif(srcs[labels[signature][0]] != 0 and dsts[labels[signature][1]] != 0):
            src_label = random.randint(0, signature)
            while (src_label in srcs.values() or (signature - src_label) in dsts.values()):
                src_label = random.randint(0, signature)
            # dst_label = signature - src_label
            rec_change_src_label(labels[signature][0], labels, signature, src_label, srcs, dsts)
            # rec_change_dst_label(labels[signature][1], labels, signature, dst_label, srcs, dsts)
        else:
            pass

        srcs[labels[signature][0]] = src_label
        dsts[labels[signature][1]] = dst_label

    # There's a extra-case: some S or D associated with another S or D creates unwanted accepted signatures
    # Solution --> at the end of the whole process,
    # re-draw those two problematic S and D that generate an unwanted accepted signature
    # --> change by consequence any associated D and S in other edges

    for src in srcs:
        for dest in dsts:
            if([src, dest] in labels.values()):
                continue
            elif(srcs[src] + dsts[dest] in signatures):
                src_label = random.randint(0, (2 ** n) - 1)
                while (src_label in srcs.values()):
                    src_label = random.randint(0, (2 ** n) - 1)
                rec_change_src_label(src, labels, 0, src_label, srcs, dsts)
            else:
                continue

    nh = math.ceil(n / 4)
    for entry in srcs:
        srcs[entry] = "0x" + hex((srcs[entry] + (1 << n)) % (1 << n))[2:].zfill(nh)
    for entry in dsts:
        dsts[entry] = "0x" + hex((dsts[entry] + (1 << n)) % (1 << n))[2:].zfill(nh)

    return srcs, dsts, config_mem_words

if __name__ == '__main__':
    # edges = [
    #     ['S1', 'D1'],
    #     ['S1', 'D2'],
    #     ['S2', 'D1'],
    #     ['S2', 'D3'],
    #     ['S3', 'D2'],
    #     ['S4', 'D4'],
    #     ['S5', 'D5'],
    #     ['S2', 'D5'],
    #     ['S6', 'D6']
    # ]
    # srcs_dict, dsts_dict, config_words = generate_labels(edges, 7)
    srcs_dict, dsts_dict, config_words = generate_labels([], 20, "jsons/picojpeg-instr.json")
    print(srcs_dict)
    print(dsts_dict)
    print("Total number of generated labels: ", len(srcs_dict)+len(dsts_dict))
    print(config_words)