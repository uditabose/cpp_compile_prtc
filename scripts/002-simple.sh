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
