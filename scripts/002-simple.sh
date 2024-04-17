#!/usr/bin/env bash

bazel build //src/002-simple:simple-lib  
otool -L bazel-bin/src/002-simple/libsimple-lib.a

# Archive : bazel-bin/src/002-simple/libsimple-lib.a
# bazel-bin/src/002-simple/libsimple-lib.a(function.o):
# bazel-bin/src/002-simple/libsimple-lib.a(main.o):

bazel run //src/002-simple:simple

# preprocessor output
gcc -E src/002-simple/function.c -o src/002-simple/out/function.i
gcc -E src/002-simple/main.c -o src/002-simple/out/main.i

# assembler output
gcc -S src/002-simple/main.c -o src/002-simple/out/main.s

# at&t assembler
gcc -S -masm=att src/002-simple/main.c -o src/002-simple/out/main.att.s
gcc -S -masm=att src/002-simple/function.c -o src/002-simple/out/function.s

# intel assembler
gcc -S -masm=intel src/002-simple/function.c -o src/002-simple/out/function.intel.s

# object dump
objdump -D bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o > src/002-simple/out/func.dump.txt
objdump -D -M intel bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o > src/002-simple/out/func-intel.dump.txt

# symbol examin
nm bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o > src/002-simple/out/function.symbol.txt

# file 
file bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o
# bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o: Mach-O 64-bit object arm64

size bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o
# __TEXT  __DATA  __OBJC  others  dec     hex
# 108     0       0       64      172     ac
 
size /Users/uditabose/spaces/cpp_compile_prtc/bazel-bin/src/002-simple/simple
# __TEXT  __DATA  __OBJC  others  dec     hex
# 16384   16384   0       4294983680      4295016448      10000c000

ldd bazel-bin/src/002-simple/simple

objdump -p bazel-bin/src/002-simple/simple > src/002-simple/out/simple.objdump.txt
nm /Users/uditabose/spaces/cpp_compile_prtc/bazel-bin/src/002-simple/simple > src/002-simple/out/simple.symbol.txt  

brew update && brew install binutils

objdump -pt bazel-bin/src/002-simple/simple
# bazel-bin/src/002-simple/simple:     file format mach-o-arm64
#  MACH-O header:
#    magic:      0xfeedfacf
#    cputype:    0x100000c (ARM64)
#    cpusubtype: 0 (ARM64_ALL)
#    filetype:   0x2
#    ncmds:      0x14
#    sizeocmds:  0x448
#    flags:      0x200085
#    version:    2

# SYMBOL TABLE:
# 0000000100000000 g       0f SECT   01 0010 [.text] __mh_execute_header
# 0000000100003ed8 g       0f SECT   01 0000 [.text] _add
# 0000000100003f00 g       0f SECT   01 0000 [.text] _add_and_multiply
# 0000000100003f44 g       0f SECT   01 0000 [.text] _main
# 0000000100004000 g       0f SECT   03 0000 [__DATA.__common] _nCompletionStatus


objdump -pt bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o

# bazel-out/darwin_arm64-fastbuild/bin/src/002-simple/_objs/simple/function.o:     file format mach-o-arm64
#  MACH-O header:
#    magic:      0xfeedfacf
#    cputype:    0x100000c (ARM64)
#    cpusubtype: 0 (ARM64_ALL)
#    filetype:   0x1
#    ncmds:      0x4
#    sizeocmds:  0x168
#    flags:      0x2000
#    version:    2

# SYMBOL TABLE:
# 0000000000000000 l       0e SECT   01 0000 [.text] ltmp0
# 0000000000000070 l       0e SECT   02 0000 [__LD.__compact_unwind] ltmp1
# 0000000000000000 g       0f SECT   01 0000 [.text] _add
# 0000000000000028 g       0f SECT   01 0000 [.text] _add_and_multiply

