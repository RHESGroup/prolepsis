## PseudoCode

### definitions

We define `G = (V,E)` the `global CFG` where `V` is the set of basic blocks (also called `nodes` of the graph) of all the functions in the program under analysis
and `E` is the set of branches (also called `edges`, that connects `nodes` in the graph) . It's worth to notice that the global CFG It's not the CFG related only to
a specific function but the CFG related to all the functions.
For example in case of a basic block `vi` ending with a function call instruction (like `bl func`), redirecting the execution to
basic block `vj` (that will be the first basic block of the function called),
the global CFG `G` will contain an edge `e` from `vi` to `vj` even if the two basic block are in different functions.

We define as indirect forward edge an edge `e` connecting:
- `vi`: where `vi` is a basic block which last instruction is an indirect function call (like `bx r7`)
- `vj`: where `vj` is a basic block which first instruction correspond to the first instruction of the function `vj` belongs to

The direction of the edge is from `vi` to `vj`

We define as a backward edge an edge `e` connecting:
- `vi`: where `vi` is a basic block which last instruction is a return instruction. It could be either: `bx lr` or `pop pc`
- `vj`: where `vj` is a basic block which first instruction is the target to which will return `vi`

We define as successors of a node `vi` the set of nodes `VJ` where for every node `vj` in `VJ` it exists an edge `ej` going from `vi` to `vj`.

We define as predecessors of a node `vi` the set of nodes `VJ` where for every node `vj` in `VJ` it exists an edge `ej` going from `vj` to `vi`.


### Definitions in the pseudocode

`G` is the global control flow graph generated with angr. (this is in the pseudocode. Refers to next section for further details).
`E` is the set of edges `e`.
An edge `e` of type `indirect forward edge` is an object with the following fields:
- source basic block
- list of target basic blocks

An edge `e` of type `backward edge` is an object with the following fields:
- source basic block
- list of pairs (target basic block,caller basic block)

### Pseudocode retrieval of indirect forward and backward edges and instrumentation

The global CFG `G` is automatically generated by the angr library.
The analysis performed by angr will also provide the list of functions and IRQHandlers in the program.
In addition the parameter `resolve_indirect_jumps` automatically construct the history of a given register,
when used inside a branch instruction, and retrieve It's value. In this way It's possible to get automatically what
is the destination of an indirect branch.
It is also important to notice that in the pseudocode the CFG `G` corresponds to the cfg generated in the file `Cfi.py` at line `111` with the following instruction:
```
cfg = b.analyses.CFGEmulated(keep_state=True, state_add_options=angr.sim_options.refs,
                                     context_sensitivity_level=0,
                                     resolve_indirect_jumps=True)
```

It is important to notice that here the variable `cfg` will contain all the result of the analysis.
In particular for every basic block `vi` It creates an object called `Node` for which It is possible to obtain
who are his successors and predecessors by calling, respectively, the following methods on the `Node` object:
- `Node.successors()`
- `Node.predecessors()`

The methods will return again a list of objects of type `Node` for which It is again possible to obtain his 
predecessors and successors.

The `cfg` variable allows to obtain the Node `n` from a basic block `bb` by calling:
- `n = cfg.getNode(bb)`

- From there it is possible to obtain his successors and predecessors by calling:
- `n.predecessors()`
- `n.successors()`

The `cfg` variable also allows to obtain the function `f`, the basic block `bb`, belongs to by calling:
- `f = cfg.getFunction(bb)`

Notice that methods like `cfg.getNode()` or `cfg.getFuction()` actually doesn't exist.
These are just pseudo-methods that I have introduced in order to simplify the pseudocode.

The psuedo-instruction `n = cfg.getNode(bb)` corresponds to the following real methods/instructions:
```
n = cfg.model.get_any_node(bb.addr)
```

The psuedo-instruction `f = cfg.getFunction(bb)` corresponds to the following real methods/instructions:
```
n = cfg.model.get_any_node(bb.addr)
f = cfg.kb.functions[n.function_address]
```

Here the full pseudocode for retrieval of edges and instrumentation of the code:
```
def getCallBBs(func):
    call_bbs = []
    basicBlocks = func.getBasicBlocks() #ritorna tutti i basic block all'interno della funzione
    for bb in basicBlocks:
        if bb ends with an indirect call:
            call_bbs <-- bb
    return call_bbs
    
def getRetBBs(func):
    ret_bbs = []
    basicBlocks = getFunctionBasicBlocks(func)
    for bb in basicBlocks:
        if bb ends with a return:
            ret_bbs <-- bb
    return ret_bbs        

def isInsecure(bb, func):
    # se l'ultima istruzione contiene pc (è del tipo pop pc o ldr pc o simile)
    #è non sicura per definizione
    # se l'ultima istruzione è del tipo bx lr, si controlla se esiste un istruzione nella funzione corrente,
    # per sapere se lr è stato caricato nello stack.
    # Se è stato caricato nello stack questo implica che sarà ricaricato dallo stack in lr,
    # cosa che lo rende insicuro
     if "pc" in lastInstruction(bb):
        return true
    else if "bx lr" in lastInstruction(bb):
        instructions = getFunctionInstructions(func) #ottengo tutte le istruzioni associate alla funzione e le salvo nella lista instructions
        for i in instructions:
            if "push lr" in i:
                return true
    return false
    
def getCallTargets(bb, cfg):    
    #ottengo il nodo associato al basic block, all'interno del CFG e ritorno i suoi successori
    return cfg.getNode(bb).successors

def getReturnTargets(bb,cfg):
    #ottengo il nodo associato al basic block, all'interno del CFG e ritorno i suoi successori
    return cfg.getNode(bb).successors

def getCallerFromReturnTarget(returnTarget_bb,G):
    #in questa funzione devo ottenere il basic block chiamante a partire da un basic block
    #che il target di un istruzione di ritorno (anche chiamato dopo basic block di ritorno).
    #considera il seguente listato:
    #;basic block chiamante
    #add some,some
    #move some,some
    #sub some,some
    #bl funzione
    #;inizio del basic block di ritorno
    #sub some,some
    #move some,some
    #move some,some
    #Per ottenerlo ottengo i basic block all'interno della funzione li ordino (in base all'indirizzo
    #a cui si trovano) e poi prendo come basic block chiamante quello che si trova appena prima.
    func = G.getFunction(returnTarget_bb)
    bbs = func.getBasicBlocks() #ritorna i basic block all'interno della funzione
    returnTarget_bb_pos = bbs.index(returnTarget_bb) #ottengo l'indice del basic block di ritorno
    returnCaller_bb = bbs[returnTarget_bb_pos-1] #ottengo il basic block chiamante considerando che la sua posizione è posizione del basic block di ritorno - 1
    return returnCaller_bb
    
def addBackwardEdge(edges, source_bb, target_bb, caller_bb):
    if there isn't a backward edge object with source basic block as source_bb:
        create a new one and add it to edges.
        Then add the pair target_bb, caller_bb to list of targets associated with source_bb.
    else:
        find backward edge object with source basic block equals to source_bb.
        Add the pair target_bb, caller_bb to list of targets associated with source_bb.

def addForwardEdge(edges,source_bb, target_bb):
    if there isn't a forward edge object with source basic block as source_bb:
        create a new one and add it to edges.
        Then add target_bb to list of targets associated with source_bb.
    else:
        find forward edge object with source basic block equals to source_bb.
        add target_bb to list of targets associated with source_bb.    
        
                    
def main:
         
    for func in all_functions:
        # ottengo i basic block all'interno della funzione
        # che corrispondono a chiamate a funzione  
        call_bbs = getCallBBs(func)
        for c in call_bbs:
            # ottengo i target della chiamata
            for t in getCallTargets(c, G):
                addForwardEdge(E, c, t)
        ret_bbs = getRetBBs(func)
        for r in ret_bbs:
            if isInsecure(r, func):
                for t in getReturnTargets(c,G):
                    caller = getCallerFromReturnTarget(t,G)
                    addBackwardEdge(E, r, t, caller)
                    
    #here start the instrumentation process            
    for edge e in E:
        if e is of type forward edge:
            if length of list of targets of e == 1:
                apply instrumentation of type 1 to source basic block and target basic block
            else if length of list of targets of e > 1:
                apply instrumentation of type 1 to source basic block
                for target basic block in list of targets of e:
                     apply instrumentation of type 1 to target basic block
        else if e is of type backward edge:
            if length of list of targets of e == 1:
                apply instrumentation of type 1 to source basic block and target basic block
                if caller basic block of e ends with indirect call:
                    replace previously applied instrumentation with type 7 instrumentation, to caller basic block
            else if length of list of targets of e > 1:
                apply instrumentation of type 1 to source basic block and target basic block
                for (caller basic block,target basic block) in list of targets of e:
                    apply instrumentation of type 2 to target basic block
                    if caller basic block ends with indirect call:
                        replace previously applied instrumentation with type 7 instrumentation, to caller basic block
                    else:
                        apply type 5 instrumentation to caller basic block
    
    for IRQhandler in all_IRQHandlers:
        apply instrumentation of type 8 to entry point of IRQHandler
        ret_bbs = getRetBBs(func)
        for ret_bb in ret_bbs:
            apply instrumentation of type 9 to ret_bb
```