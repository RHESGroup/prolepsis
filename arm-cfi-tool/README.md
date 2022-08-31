# Compiling the benchmarks
Benchmarks were taken from `embench-iot` repository here: https://github.com/embench/embench-iot.
Execute the following commands for producing the benchmarks and placing it under the `arm-cfi-tool` folder:
```
$ git clone https://github.com/embench/embench-iot.git
$ cd embench-iot
$ chmod +x buid_all.py
$ ./build_all.py --clean --builddir <path-to-prolepsis>/arm-cfi-tool/arm-benchmarks --arch arm --chip cortex-m4 --board stm32f4-discovery --cc <path-to-binaries-arm-toolchain>/arm-none-eabi-gcc  --cflags="-c -O0  -ffunction-sections -MMD -MP -mthumb --specs=nosys.specs -mcpu=cortex-m4" --ldflags="-Wl,-gc-sections --specs=nosys.specs -mcpu=cortex-m4 -mthumb" --user-libs="-lm"

```
The last command will output the benchmarks directly under the folder `arm-benchmarks`. This will allow you to automatically run the tool on them using the script ` run-on-benchmarks.sh`. Go to the proper section later in the current `README.md` for further information on how to run the script.


# CFI tool

It is a Python engine that deals with the binary instrumentation process during the offline phase.
The script activity enjoys the support of the external module `r2pipe`, that handles the communication with the reverse-engineering framework `Radare2` through pipes and the API provided by the angr` python library 

## Radare2 and r2pipe

The application requires the installation of `Radare2` and `r2pipe` on the system on which the Python code runs. The guidelines for downloading and installing `Radare2` are available below.

- [Guide to install Radare2](https://github.com/radareorg/radare2)
- [Compilation on Windows](https://radare.gitbooks.io/radare2book/content/first_steps/windows_compilation.html)

For installing `r2pipe` run the following command:
`$ pip3 install r2pipe`

## Using the tool

The Python script accepts as inputs:
- the **disassembly listing** of the **.text** section  through the `-disassembly` parameter
- the **binary to be instrumented** through the `-binary` parameter
- the **disassembly listing** of the **.rodata**, **.data**, **.bss** sections through the `-disassemblyfull` parameter
- the file containing the instrumentation instructions through the `-typesfile` parameter
- the output file containing information related to edges found and instrumented throgugh the `-outputfile` parameter
- the output file containing the assembly file with the instrumentation to be recompiled through the `-outputfileassembly`


The content of the output file specified through the `-outputfile` parameter, is a json file containing a json array, where each element represents an edge location and has the following fields:
- `type`: specify if it is a `backward` or a `forward` edge location
- `source`: an element specifying `source address` (the address of the branch instruction like `pop pc`,`bx lr`,`bx r4`) and `source label` (the label associated with the instrumentation applied at `source address`
- `destinations`: a json array where each elements contains: `destination address` (the target reached by `source address`) and `destination label` (the label associated with the instrumentation applied at `destination address`). In case `type` is equal to `backward` the element contains also `caller address` (the address to the instruction that executed the function call. The return address of the function call corresponds to `destination address`) and `caller label` (the label associated with the instrumentation applied at `caller address`). Notice that `caller label` and `destination label` are always the same for every element.

The instrumented version is available in the assembly file specified through the parameter `-outputfileassembly`.


### Running the script
```
$ python3 main.py
AUTOMATIC BINARY ANALYSIS AND INSTRUMENTATION PROCESS
Version 0.1
usage: main.py [-h] [-disassembly file.list] [-binary file.elf] [-report] [-outputfile OUTPUTFILE]

Applies CFI to given firmware

optional arguments:
  -h, --help            show this help message and exit
  -disassembly file.list
                        disassembly file
  -binary file.elf      binary file
  -report               turn ON generatation of report
  -outputfile OUTPUTFILE
                        Output filename to write info related to edges and labels in JSON format
```


```
$ python3 main.py -disassembly crc32.list -disassemblyfull crc32-data.list -binary crc32 -outputfileassembly crc32_mod -outputfile crc32-instr
...
...
instrumenting forward edges...
forward edges instrumented successfully.
instrumenting backward edges...
backward edges instrumented successfully.
instrumenting IRQHandlers...
IRQHandlers instrumented successfully.
writing instrumented assembly to out_mod_2.s...
instrumented assembly successfully written to out_mod_2.s
writing edges with labels to out.json...
edges with labels successfully written to out.json
...
...
```
Inspecting the results inside crc32-instr.json:
```
$ cat out.json | jq .
[
  {
    "type": "backward",
    "source": {
      "source_addr": "0x80801e2",
      "source_label": 15088
    },
    "destinations": [
      {
        "dest_addr": "0x808ae66",
        "dest_label": 15930,
        "caller_addr": "0x808ae64",
        "caller_label": 15930
      },
      {
        "dest_addr": "0x808ae70",
        "dest_label": 50325,
        "caller_addr": "0x808ae6e",
        "caller_label": 50325
      }
    ]
  },
...
...
...
  {
    "type": "backward",
    "source": {
      "source_addr": "0x808b682",
      "source_label": 12741
    },
    "destinations": [
      {
        "dest_addr": "0x808b10c",
        "dest_label": 62261,
        "caller_addr": "0x808b108",
        "caller_label": 62261
      }
    ]
  },
  {
    "type": "backward",
    "source": {
      "source_addr": "0x808b6ea",
      "source_label": 50671
    },
    "destinations": [
      {
        "dest_addr": "0x808ae54",
        "dest_label": 30307,
        "caller_addr": "0x808ae50",
        "caller_label": 30307
      }
    ]
  }
]
$
```

### Running the script on all benchmarks
Execute the script run-on-benchmarks.sh in order to perform instrumentation on all benchmarks. Use the variable `arm_toolchain_path` to set path to binaries inside your arm-toolchain. `objdump` will be used in order to disassemble .text and .data .rodata .bss sections. `gcc` and `ld` will be used in order recompile the instrumented modded assembly.
You can set the variable `recompile` to `0` in order to stop to the instrumentation step and not recompile the modded assembly files.
The tool for each benchmarks at the path `./arm-benchmarks/src/<benchmark-name>/` will produce the instrumented assembly file with name `<benchmark-name>_mod.s` 

In any case all the results will be logged to console as can be seen from this screenshot:
![image](https://user-images.githubusercontent.com/74059030/181766183-d95c2a93-b15f-47bc-b1df-c3b76f65a16e.png)

To suppress errors execute the script with the following command:
```
./run-on-benchmarks.sh 2>/dev/null
```

 ### Changing label generation strategy
 There are two functions performing label generation that are `createLabelMap` and `createLabelMap2`.  `createLabelMap` produces labels completely randomly while `createLabelMap2` second one produces labels according to an optimized strategy.
 In order to change the generation strategy it is enough to change `line 236` in `Cfi.py`. In case of using `createLabelMap2` it is enough to write:
  ```
  labelMap = createLabelMap2(edgesMap)
  ```
  `CreateLabelMap2` is implemented inside `Utils.py`. It is a wrapper around `generate_labels`. You can change the number passed to generate_labels by modifying the call at line 116:
  ```
  def createLabelMap2(edgesMap):
    l = []
    labelMap = {}
    for k,v in edgesMap.items():
        l.extend(v.getEdges())
    srcs, dsts, config_mem_words = label_generator.generate_labels(l,20)  #here replace 20 with something else in case needed

    for k,v in srcs.items():
        labelMap[int(k,16)] = v
...
  ...
  ```

