
#!/usr/bin/env bash

bazel build //src/002-simple:simple-lib  
otool -L   bazel-bin/src/002-simple/libsimple-lib.a                                                                                                                          [21:40:25]

# Archive : bazel-bin/src/002-simple/libsimple-lib.a
# bazel-bin/src/002-simple/libsimple-lib.a(function.o):
# bazel-bin/src/002-simple/libsimple-lib.a(main.o):

bazel run //src/002-simple:simple

gcc -E src/002-simple/function.c -o src/002-simple/out/function.i 
