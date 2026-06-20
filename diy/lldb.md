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

attaching to a file/thread:

breakpoint to specific file/line/function:

flow control:

show execution state/variables: