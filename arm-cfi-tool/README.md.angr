# CFI tool
The program in the main take as input a .list file and a .elf file where the .list file corresponds to the disassembly listing
extracted from the .elf file.
After that It is called the function CFI.start() that will perform all the operations.

## parsing .list file
The first operation that is peformed, is parsing the .list file and produce the assembly code with labels.
The operation is performed by the function `CFI.get_assembly()`. The assembly code with labels is stored in the variable `CFI.code`, and is finally output to file out.s.
`CFI.code` is dictionary where each pair has as key the address of the instruction and as value the instruction itself.

First it is checked if the line is the starting of a function, if it is true it will insert inside `self.code` a key-value pair in the form of
`<address of first instruction of the function>`:`<fuction_name>:`.
If it is false it will detect through a series of regular expressions if it is:
- a conditional/unconditional jump instruction
- a non jump instruction

If it is a non jump instruction It will just add the key-value pair `<instruction address>`:`<assembly instruction>` to the dictionary `self.code`. 
If it is a conditional/unconditional jump instruction it will create a label of the form `labN_functionname`, where `N` is incremented at each new label in the same function,
add will produce a pair `<instruction address>`:`<label>\t<assembly instruction>` for the destination of the jump instruction.
On the other hand for the jump instruction itself it will produce again key-value pair in the form of
`<instruction address>`:`<assembly instruction>` but replaces the destination hexadecimal address with the label previously created.

Finally Each key-value pair of the dictionary `self.code` is printed to the output file called `out.s`.

Here as an example, the final content of `out.s` for the function `dijkstra` of `UART-dijsktra`:
```
dijkstra:
	push	{r7, lr}
	sub	sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [pc, #296]	 ;  (808a810 <dijkstra+0x134>)
	movs	r2, #0
	str	r2, [r3, #0]
	b.n lab0_dijkstra
lab1_dijkstra: 	ldr	r3, [pc, #288]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #288]	 ;  (808a814 <dijkstra+0x138>)
	movw	r1, #9999	 ;  0x270f
	str.w	r1, [r2, r3, lsl #3]
	ldr	r3, [pc, #272]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	ldr	r2, [pc, #272]	 ;  (808a814 <dijkstra+0x138>)
	lsls	r3, r3, #3
	add	r3, r2
	movw	r2, #9999	 ;  0x270f
	str	r2, [r3, #4]
	ldr	r3, [pc, #256]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	adds	r3, #1
	ldr	r2, [pc, #252]	 ;  (808a810 <dijkstra+0x134>)
	str	r3, [r2, #0]
lab0_dijkstra: 	ldr	r3, [pc, #248]	 ;  (808a810 <dijkstra+0x134>)
	ldr	r3, [r3, #0]
	cmp	r3, #99	 ;  0x63
	ble.n lab1_dijkstra
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	beq.n lab2_dijkstra
	ldr	r2, [pc, #236]	 ;  (808a814 <dijkstra+0x138>)
	ldr	r3, [r7, #4]
	movs	r1, #0
	str.w	r1, [r2, r3, lsl #3]
	ldr	r2, [pc, #224]	 ;  (808a814 <dijkstra+0x138>)
	ldr	r3, [r7, #4]
	lsls	r3, r3, #3
	add	r3, r2
	...
	...
```
Notice that now labels were inserted in front of instruction and inside jump instruction, as can be seen considering
the instruction `beq.n lab2_dijkstra`.

## extracting edges

In order to extract forward and backward edges from the binary It was haeavily used the **angr** library. Some additional data structures were introduced in order
to carry out the operations.
The main data structures that were used are:
- **MultipleForwardEdges**
- **MultipleBackwardEdges**
- **edgesMap**
- **labelMap**

#### MultipleForwardEdges
`MultipleForwardEdges` is a ***class*** defined in ***Utils.py***. It represents a ***set of indirect jumps***, starting from the same source, and each ending towards a different destinations. 
It has the following properties:
- `source_bb`: corresponds to a source basic block, that is the source of the possible forward indirect jumps. Therefore the last instruction of `source_bb` will be something like: `blx r3`
- `dest_bbs`: is a list storing the list of possible targets of the jump instruction inside `source_bb`

#### MultipleBackwardEdges
`MultipleBackwardEdges` is a ***class*** defined in ***Utils.py***. It represents a ***set of returns***, starting from the same source, and each one ending towards a different destinations.
It has the following properties:
- `source_bb`: corresponds to the source basic block, that is the source of the possible returns. The last instruction inside `source_bb` will be something like `bx lr` or `pop pc`
- `callerAndRet_bbs`: corresponds to a list of elements where each element has the following fields: `caller_bb` and `dest_bb`

`dest_bb` corresponds to a possible target of the return from `source_bb`. `caller_bb` instead corresponds to the basic block before `dest_bb` that caused the call.

Here is an example in order to better understand how `MultipleBackwardEdges` is used.
Let's consider three functions `func1`,`func2` and `func3` where `func1` calls `func3` and `func2` calls `func3`.
`func1` contains the following instructions:
```
...
add r5,r6
bl func3
move r2,r3
add r3,r4
```
While `func2` contains the following instructions:
```
...
sub r3,r4
bl func3
sub r7,r6
add r3,#2
...
```
And `func3` at the end will have the following instructions:
```
...
move r3,#8
move r4,0
pop pc
```

Inside a MultipleBackwardEdge object we will store in `source_bb` the basic block inside `func3` containing the `pop pc` instruction (the return).
While in the list `dest_bbs` we will store two objects with fields `dest_bb` and `caller_bb`.
For one object:
- inside `dest_bb` there will be the basic block `... sub r7,r6 add r3,#` of func1, that is the destination of `source_bb` when `pop` returns to function1.
- inside `caller_bb` there will be the basic block `add r5,r6 bl func3 ...` of func1, that is a block ending with a call to `func3` and is associated with destination `dest_bb`

For the other object the reasoning is the same but this time applied to `func2`. So in `dest_bb` there will be `sub r7,r6 add r3,#2 ...`, that is the destination of `source_bb` when `pop` returns to function2,
while `caller_bb` contains `sub r3,r4 bl func3` that is the basic block of `func2` that ends with a call to `func3` and is associated with `dest_bb`.

#### edgesMap
Is a map where each element has:
- as `key` a `source_bb` either of a `MultipleBackwardEdges` or a `MultipleForwardEdges` object
- as `value` either a `MultipleBackwardEdges` or a `MultipleForwardEdges`

#### labelMap
Is a map where each element has:
- as `key` a `basic block`.
- as `value` a `label`. The label is value generated randomically through the helper function ***Utils.generateValidRandom()***

This map basically assigns a unique `label` to each `basic block` and will be used during the instrumentation process.

N.B: In this document, with the term `map`, I'm actually referring to a python `dictionary`.

### generation of the global CFG
The global CFG is automatically generated by angr with the following instruction:
```
cfg = b.analyses.CFGEmulated(keep_state=True, state_add_options=angr.sim_options.refs,
                                     context_sensitivity_level=0,
                                     resolve_indirect_jumps=True)         
```

Every basic block of every function will be considered as a node of the `cfg` generated by angr.
For every node, through angr, it is possible to retrieve his successors. Where the successors of a basic block will be the basic blocks directly connected to himself
when we consider the CFG.
Angr produces a global CFG, The main difference betweeen a global CFG and a non global CFG is that the latter usually is only related to a function.
In a simple CFG a basic block can have as successors, or predecessors, only basic blocks 
 that are inside the same function. This means there will be no basic blocks ending with function call instructions like `bl function1`.
On the other hand, the global CFG can provide basic blocks ending with a call instruction.
This means that with the global CFG in case is found a basic block ending in a function call, his successor will be the next basic block, reached by the execution flow, inside the
called function. The same applies also for basic block ending with a return instruction like `pop pc` or `bx lr`.
This feature demonstrates to be very useful for our purposes.

### edges extraction process

Ones the `cfg` is generated, by cycling over all the functions backward and forward edges are detected and added to `edgesMap`.

Here It starts cycling over all the functions:
```
        for func in list(cfg.kb.functions.values()):
```
Inside the for cycle first a list of `call site` is obtained through `func.get_call_sites()`. A `call site` is the address of a basic block, inside the current function, ending with a function call.
For every `call site` is retrieved what is the target of the function call. Then It is checked if the function call is an indirect call using `isIndirectCall()`.
If it is true then a forward edge is inserted, through `addForwardEdge()`, inside `edgesMap`.
```
            for call_site in list(func.get_call_sites()):
                bbSource = func.get_block(call_site)
                targetAddr = func.get_call_target(call_site)
                if isIndirectCall(bbSource) and targetAddr:
                    bbDest = cfg.model.get_any_node(targetAddr).block
                    addForwardEdge(edgesMap,bbSource,bbDest)
```
After that, the `return sites` are obtained for the current function through `func.ret_sites`. A `return site` will be the address of a basic block ending with a return instruction like `pop pc` or `bx lr`.
Then the `return sites` are filtered by taking only the insecure ones. A `return site` will be considered insecure if the function `isInsecureReturn()` will return true or false.
`isInsecureReturn()` will obtain the function associated to the `return site`, then get all the instructions inside the function, and if it finds an instruction of type `push lr` in the function, then consider it insecure and return true. (since for sure the return address will have to be later popped from the stack)
Otherwise will return false.
All this operations are performed inside this instruction:
```
            insecure_ret_sites = list(filter(lambda x: isInsecureReturn(x,cfg), func.ret_sites))

```
After that, for every `ret site` among the insecure ones the node associated to the `ret site` is retrieved with the instruction:
`CFGEnode = cfg.model.get_any_node(ret_site.addr)`, then the targets of the return are obtained by getting the successors of the node with `CFGEretNodes = list(s for s in CFGEnode.successors)`.
the block of instruction inside `if getLastInstruction(ret_site_block).address ....` is just performed in order to check that ret_site wasn't already saved inside `edgesMap`.
After that for every target saved inside `CFGEretNodes` the `caller block` is retrieved, and then a backwardEdge is added to `edgesMap` and the triplet (caller block,return block,target of return block) is saved inside `edgesMap`.

N.B:
I've noticed that not all the possible destinations can be retrieved with this method. For this with the following instruction 
`CFGEcallerNodes = cfg.model.get_any_node(func.startpoint.addr).predecessors` I retrieve what are the predecessors of the entrypoint of the function
(that means I retrieve all the nodes in the cfg that calling the function). After that for each of them I obtain what is the corresponding `return node`, that is the node the execution will return after executing the function,
and again I add backwardEdge. These operations are performed by the snipped of code starting with `for CFGEretNode in CFGEretNodes:...`
Possible duplicated are handled by the `addBackwardEdge()` function itself.

Here the full piece of code that retrieve backward edges.
```
            for ret_site in insecure_ret_sites:
                CFGEnode = cfg.model.get_any_node(ret_site.addr)
                ret_site_block = CFGEnode.block
                CFGEretNodes = list(s for s in CFGEnode.successors)
                if getLastInstruction(ret_site_block).address in [getLastInstruction(bb).address
                                                                  for bb in edgesMap.keys()]:
                    ret_site_block = list(filter(lambda bb:
                                            getLastInstruction(bb).address == getLastInstruction(ret_site_block).address,
                                            list(edgesMap.keys())))[0]
                CFGEretNodes = list(filter(lambda x: x.block != ret_site_block,CFGEretNodes))
                for CFGEretNode in CFGEretNodes:
                    ret_block = CFGEretNode.block
                    caller_block = retrieveCallerBlock(CFGEretNode,cfg)
                    addBackwardEdge(edgesMap, ret_site_block, ret_block, caller_block)
                for CFGEcallerNode in CFGEcallerNodes:
                    ret_block = retrieveReturnBlock(CFGEcallerNode,cfg)
                    if ret_block != None:
                        caller_block = CFGEcallerNode.block
                        addBackwardEdge(edgesMap,ret_site_block,ret_block,caller_block)
```
## generation of the labels
Labels for basic blocks are generated with the function `createLabelMap()`, that will produce a dictionary stored inside `labelMap`. `labelMap` was described previously.
`createLabelMap` takes as input `edgesMap`, retrieve all the basic blocks stored inside `edgesMap`, remove duplicates with `    labelMap = dict.fromkeys(l)
` and then for every basic block a random integer number is generated and stored, together with the basic block inside `labelMap`.
This last is performed by the following snippet of code:
```
    for k in labelMap:
        r = generateValidRandom(labelMap)
        labelMap[k] = r
```
`labelMap` was transformed from a list of basic blocks to a dictionary with pairs (basic block,label).

## Instrumentation process
In this part the instrumentation is applied by inserting instructions to the assembly file `out.s`, that was previously produced by `CFI.get_assembly()`.
With this instruction `temp = list(self.code)`, inside `temp` will be stored the list of all the addresses to instructions. It will be used in order to retrieve, given an address, to what position in the assembly file (position as number of line in `out.s`) the instrumentation must be applied.
Here first forwardEdges are instrumented and then backwardEdges are instrumented as well.
Separately also IRQHandlers are instrumented.


## Digging deeper into retrieval of target of indirect edge

### Some background on IR VEX (intermediate representation of instruction used by angr)
**IRSB**: means `Intermediate Representation Super Block` and corresponds to a basic block but the instructions inside it aren't assembly instruction but `statements`. A set of `statements` in angr corresponds to an assembly instruction. Let's consider this example:

Here there is an ARM assembly instruction:
```
subs R2, R2, #8

```
This instruction takes R2 subtract from it 8 and then store the results in R2. Then the PC is updated.
The corresponding intermediate representation of the assembly instruction is:
```
t0 = GET:I32(16)
t1 = 0x8:I32
t3 = Sub32(t0,t1)
PUT(16) = t3
PUT(68) = 0x59FC8:I32
```

t0,t1,t3 are variables used internally by angr that do not map to registers. registers instead are mapped as offsets inside a flat memory region used by angr. For example here `R2` corresponds to offset `16` inside the flat memory region used by angr. 
With the first statement `t0 = GET:I32(16)` saves in t0 a 32 bit integer loaded from offset `16` in the memory region used by angr for registers. Since offset `16` corresponds to r2 it is equivalent to say: "read a 32 bit integer inside r2 and write it to t0".
The second statement loads the constant 8 inside t1 and the third one perform the substruction and store the result in t3. The IR statement `PUT(16) = t3` basically means store the content of t3 inside R2. (remember the mapping: everytime you find 16 means R2). The last one basically updated PC (PC is mapped with offset 68).

## Angr ARM Indirect Jump Resolution
Angr everytime encounters an indirect function call (for example of the form `bx <reg>`) It will call the `resolve` method of the class `angr.analyses.cfg.indirect_jump_resolvers.ArmElfFastResolver`. The signature of the resolve method is the following: `def resolve(self, cfg, addr, func_addr, block, jumpkind):`.
- `cfg`: corresponds to an instance of the global CFG generated by angr.
- `addr`: corresponds to address of the IRSB.
- `block`: the entire IRSB object with all the statements inside it.
- `jumpkind`: the type of jump.

Let's consider the following real example from `UART-dijkstra.elf`. There is the following basic block:
```
808ae61  ldr.w   r3, [r6, r5, lsl#0x2]
808ae65  blx     r3
```
It ends with a call to R3, and the corresponding IRSB is (here each offset was translated with the register name it maps to):
```
00 | ------ IMark(0x808ae60, 4, 1) ------
   01 | t11 = GET:I32(r5)
   02 | t10 = Shl32(t11,0x02)
   03 | t12 = GET:I32(r6)
   04 | t9 = Add32(t12,t10)
   05 | t18 = LDle:I32(t9)
   06 | PUT(r3) = t18
   07 | PUT(pc) = 0x0808ae65
   08 | ------ IMark(0x808ae64, 2, 1) ------
   09 | PUT(itstate) = 0x00000000
   10 | PUT(itstate) = 0x00000000
   11 | t7 = GET:I32(r3)
   12 | PUT(lr) = 0x0808ae67
   NEXT: PUT(pc) = t7; Ijk_Call
}
```
Do not consider IMark. These statements are just a way to delimit the statements that maps to an instruction. At the end you can see the instruction `PUT(pc) = t7` where `t7` comes from `r3` given that before there is `t7 = GET:I32(r3)`.

So in this case to the `resolve` method it will be passed as addr `0x808ae61`, the address of the first instruction of the basic block, and as block the IRSB containing all the IR statements.

Inside `resolve` method It is created a `Blade` (the constructor of class `Blade` is called) that will produce a little program slice in order to identify the target of the indirect call.
The Blade constructor has the following signature: `def __init__(self, graph, dst_run, dst_stmt_idx, direction='backward', project=None, cfg=None, ignore_sp=False, ignore_bp=False, ignored_regs=None, max_level=3, base_state=None, stop_at_calls=False, cross_insn_opt=False)`, where:
- `cfg`: the cfg taken previously.
- `dst_run`: same as `addr` in the previous function.
- `dst_stmt_idx`: the index of the jump statement inside the IRSB, where the IRSB is pointed by `dst_run`. It will be always `-1` to specify it takes the last statement.
- `direction`: it is always backward. That means it will go from the current IRSB up their predecessors.


Inside the Blade constructor then it will be called the internal method `self._backward_slice()`.

Inside `self._backward_slice()` the following operations are performed:

1. First create two empty sets temps and regs that will contain the dependencies that must be resolved in order to retrieve the value of the indirect jump. Then inside `stmts` stores the list of statements inside the IRSB.
![image](https://user-images.githubusercontent.com/74059030/162706054-cd7d0749-7763-4d6a-bbad-8aa454a31a82.png)

2. Then retrieves info about the jump statement through `dst_stmt_idx` and then stores the target of the jump inside temps/regs (in this case it will store `t7` in temps since in the IRSB we have `NEXT: PUT(pc) = t7; Ijk_Call`) So now `t7` is a dependency.

3. Update `self._dst_stmt_idx` to index to last statement in `stmts` (Still to check)
![image](https://user-images.githubusercontent.com/74059030/162709155-2ce39ef0-1ed9-49bc-8f2c-13de268577f8.png)

4. Creates a SimSlicer:
![image](https://user-images.githubusercontent.com/74059030/162711142-a0ee853a-54f1-4e5d-a275-68b75084759e.png)
The SimSlicer has the signature `def __init__(self, arch, statements, target_tmps=None, target_regs=None, target_stack_offsets=None,
                 inslice_callback=None, inslice_callback_infodict=None):` where:
    - `statements`: corresponds to the list of IR statements inside the IRSB
	- `target_temps` and `target_regs`: corresponds to the list of dependencies to evaluate. (in terms of registers and temp variables)
	
	The SimSlicer will carry out the following operations:
	1. Sets internal variables to parameters passed like `self._statements` `self._target_regs` `self.target_tmps`
	2. calls the internal methods `self._alias_analysis()` `self._slice()`.
	![image](https://user-images.githubusercontent.com/74059030/162712164-38366a85-3414-4741-97e7-50165d66be6b.png)
	
	Now Let's inspect `_alias_analysis()`. It performs the following operations:
	1. First creates a `SimLightState` object and for every statement in the current IRSB, emulate the statement by loading the result of each statement in the `SimLightState`:
	![image](https://user-images.githubusercontent.com/74059030/162713761-5e720f2b-6c6e-4a24-b855-ee709795f2e2.png)
	Depending on the type of statement to emulate, a different `function handler` will be called. The `function handler` takes as input the statement to emulate and the state to update. Let's consider that must be emulated the following statement: `t11 = GET:I32(r5)`. The content of r5 must be read and then written to t11.
	In this case the method `_forward_handler_stmt_WrTmp` will be called:
	![image](https://user-images.githubusercontent.com/74059030/162792390-89d928fd-262e-4fb8-9f9e-7207935dfa77.png)
	As you can see from the screenshot, first retrieve the temp variable from the statement, then get the value to be written by calling `_forward_handler_expr()` (this method emulates the IR expression, that is the righthand side of the statement: in this case read the value from r5). And then store it inside the state object (belonging to class `SimLightState`) where temp reside.
	
	`_alias_analysis()` will just perform (as the name says) alias analysis (more info here: https://en.wikipedia.org/wiki/Alias_analysis). What we are really interested in is the method `_slice()`.
	`_slice()` will perform the following operations:
	1. Again first it creates a `SimLightState` called `state` and places inside it the registers and temp variables is interested in (for the moment we will have only `t7` since is contains the target of the jump). So will be stored inside `state.temps` and `state.regs`:
	![image](https://user-images.githubusercontent.com/74059030/162794928-1068b6a3-7109-4a2e-8126-fbf4e6303a5c.png)
	2. Then take the statements in the IRSB and start processing them in reverse order in a for loop. For every statement It will call `_backward_handler_stmt()`. `_backward_handler_stmt()` will return true if the statement is in the slice otherwise false. In order to determine if the statement is in a slice It will check if the lefthand-side (temp/register) is part of `state.temps`/`state.regs`. If It is false then the just return false and the statement is ignored. If it is true then It will remove it from `state.temps`/`state.regs` and inspect the righthand-side of the statement, retrieve the register or temp in it, and store it inside `state.temp`/`state.regs`. Then return true. For example considering that now `t7` is inside `state.temps`, when the statement `t7 = GET:I32(r3)` is encountered, `t7` is removed from state.temps and `r3` is added to `state.regs`. When the function returns true, in the original for loop, the statement is inserted together with his index respectively into self.stmts and self.stmts_indices. Then is called a callback function that update a dictionary:
	![image](https://user-images.githubusercontent.com/74059030/162815469-2ae4f769-dd5e-41b3-a10f-ac9d3703a3eb.png)
	In particular in addition to updating the dictionary is updated the set of edges and nodes inside `self._slice`:
	![image](https://user-images.githubusercontent.com/74059030/162816808-de2379bb-247d-49aa-9d39-51a89df39bff.png)
	Every node is a tuple in the form (\<address of IRSB\>, \<index of statement inside IRSB\>). Every edge is a tuple in the form (\<source node\>,\<dest node\>). Notice in the screenshot that in edges you have the edge that maps the relation between statement 06 `06 | PUT(r3) = t18` and statement 11 `11 | t7 = GET:I32(r3)`.
	3. Then it returns inside `self.final_regs` the registers that still need to be evaluated:
	![image](https://user-images.githubusercontent.com/74059030/162818349-9dd80554-c543-4e04-aab8-cdadaffad386.png)
	At the end it will return inside final regs `r5` and `r6` and in fact we still need to find their value in order to retrieve the final value of the indirect jump.

5. When the SimSlicer is created, It will save `slicer.final_regs` (`r5` and `r6` the ones that still need to be evaluated) inside `regs`. If `regs` is not empty It is required to continue the analysis on the previous IRSB so the previous IRSB is retrieved from the `cfg` and saved in the variable `pred` together with `regs`. Then calls `_backward_slice_recursive()` passing as input `pred` and `regs`:
![image](https://user-images.githubusercontent.com/74059030/162824259-27c6b606-92b0-4c2e-bf27-9fcdce2e6998.png)
At this point `backward_slice_recursive()` will perform the same operations of `backward_slice()` until `slicer.final_regs` is empty or a given threshold (in terms of analyzed IRSBs is reached).

Now that the blade `b` is constructed all the information related to the slice (the list of statements related to the indirect jump) are inside `b.slice` (what was previously `self._slice`).
In particular you can find the list of nodes and edges:
![image](https://user-images.githubusercontent.com/74059030/162826652-46fb9182-b47a-4eb9-9bfd-800d6d090dba.png)
As previously said at point 2. inside `_slice()` operations a node is a tuple in the form (\<address of IRSB\>, \<index of statement inside IRSB\>). Every edge is a tuple in the form (\<source node\>,\<dest node\>). Notice that <dest node> corresponds to a statement that is dependent on <source node>.

Now the source node is retrieved (source node corresponds basically to the origin)
![image](https://user-images.githubusercontent.com/74059030/162827764-eb7c1687-5d72-42e5-890b-1e21f2903357.png)
And then all the statements are emulated until the jump statement is reached in order to find the final value.
## Final results
The final results are stored inside a json file, by default called `mydata.json`. The filename can be optionally specified with `-outputfile` flag.
Refer to the README.md inside the main folder for more details on how to read the output of the json file.
