## brief intro

### reference
official website: [https://lldb.llvm.org](https://lldb.llvm.org)

### troubleshooting

`python311.dll not found` or `package 'uuid' not found`: reinstall python/miniconda; for conda activate an env with python=3.11; re-order `$env:Path` entries;

`rust-lldb not applicable for the current toolchain`: use `lldb` instead. to parse rust syntax `command script import ~/.rustup/xxx/etc/lookup.py` and `command source ~/.rustup/xxx/etc/lldb_commands`. to re-use some lldb commands write them into `~/.lldbinit`.

`lldb failed for dll not found`: install newest version of llvm suite.

### debug format support

there are 2 major debug formats: dwarf and codeview/pdb, dwarf commonly used for gnu, stores data into a debug section; pdb for microsoft, stores in .pdb file. lldb supports both.

lldb supports debug adaptive protocol (DAP).

### common usage

start debug:
```
target create <filename>
process launch
```

```
process attach --pid <pid> --name <process-name>
```

set breakpoint to specific file/line/function:
```
breakpoint set (-f|--file) <file> (-l|--line) <line> (-n|--name) <function-name> (-c|--condition) <condition> (-s|--shlib) <shared-lib-name> (-C|--command) <command> -N <bkpt-name> (-G|--auto-continue)
```

set breakpoint callbacks:
```
breakpoint command add --script-type (command|python|lua|default) <bkpt-id>
```

flow control:
```
process continue
thread (continue|step-in|step-out|step-over|step-inst|step-over-inst)
thread until <n>
```

show execution state/variables:
```
thread (list|select|backtrace)
frame variable <expr>
frame variable (-D|--depth) <depth> (-P|--ptr-depth) <depth> (-Z|--element-count) <count> (-r|--regex) (-s|--scope) (argument|local|global|static) <variable-name>
```

lookup source code:
```
target modules lookup (-A|--all) (-i|--no-inlines) (-v|--verbose) (-r|--regex) ( 
    (-f|--file) <file> | 
    (-s|--symbol) <symbol> | 
    (-F|--function) <function> | 
    (-t|--type) <type> 
)
```

aliases:
```
command alias <name> <cmd:([-\w]+|%\d+)(\s+([-\w]+|%\d+))*>
command unalias <name>
```

backtrace:
```
bt (\d+|all)
```

### useful default aliases
```
br = breakpoint
r = run = process launch --
c = process continue
n = next = thread step-over
finish = thread step-out
ni = thread step-inst
si = thread step-over-inst
f = frame select
image = frame modules
file = target create
```