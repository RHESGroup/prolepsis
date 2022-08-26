import json
import r2pipe
import pdb
import monkeyhex

r2 = r2pipe.open("./tool-cfi/UART-dijkstra.elf") #replace the argument with the path to the binary analyzed with tool-cfi

edges = json.load(open("./tool-cfi/anothertry2.json","r")) #replace the argument with the json file produced by tool-cfi

r2.cmd("aaaa")
r2.cmd("aaaa")

for e in edges:
    if len(e["destinations"]) > 2:
        print("source: \n" + r2.cmd("pd 1 @ %s"%e["source"]["source_addr"]))
        for d in e["destinations"]:
            print("\tinstruction at dest: \n\t" + r2.cmd("pd 1 @ %s"%d["dest_addr"]))
            print("\tinstructiona at caller: \n\t"+ r2.cmd("pd 1 @ %s"%d["caller_addr"]))
pdb.set_trace()
