#!/usr/bin/env bash

# install Bazel
brew install bazel
brew install direnv  
go install github.com/bazelbuild/buildtools/buildifier@latest
go install github.com/bazelbuild/buildtools/buildozer@latest
go install github.com/bazelbuild/buildtools/unused_deps@latest 