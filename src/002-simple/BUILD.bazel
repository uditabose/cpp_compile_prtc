load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

filegroup(
    name = "simple-src",
    srcs = glob([
        "*.h",
        "*.c",
    ]),
)

cc_library(
    name = "simple-lib",
    srcs = [
        ":simple-src",
    ],
)

cc_binary(
    name = "simple",
    srcs = [
        ":simple-src",
    ],
)
