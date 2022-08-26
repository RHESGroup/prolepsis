# CFI tool

The CFI tool supports the hybrid solution presented in *“A FPGA-based Control-Flow Integrity Solution for Securing Bare-Metal Embedded Systems”*, a paper of the last year authored by Prof. Paolo Prinetto and his PhD team here in Politecnico di Torino.

It mainly focuses on realising a Python script that deals with the binary instrumentation process during the offline phase.
The script activity enjoys the support of the external module **r2pipe**, that handles the communication with the reverse-engineering framework **Radare2** (r2) through pipes and the API provided by the **angr** python library 

## Radare2 and angr

The application requires the installation of **Radare2** and **angr** on the system on which the Python code runs. The guidelines for downloading and installing **Radare2** are available below.

- [Downloading radare2](https://radare.gitbooks.io/radare2book/content/first_steps/getting_radare.html)
- [Guide to install Radare2](https://github.com/radareorg/radare2)
- [Compilation on Windows](https://radare.gitbooks.io/radare2book/content/first_steps/windows_compilation.html)

Angr library can be installed with one of the following commands:
- `pip install angr`
- `pip3 install angr`

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
