load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com_github_kyle_figure_bazel_iwyu//bazel:prebuilt_pkg.bzl", "prebuilt_pkg")

def bazel_iwyu_dependencies():
    maybe(
        prebuilt_pkg,
        name = "iwyu_prebuilt_pkg",
        build_file = Label("//bazel/iwyu:BUILD.prebuilt_pkg"),
        urls = {
            "linux-aarch64": [
                "https://github.com/kyle-figure/bazel_iwyu/releases/download/0.20/iwyu-0.20-aarch64-linux-gnu.tar.xz",
            ],
            "linux-x86_64": [
                "https://github.com/kyle-figure/bazel_iwyu/releases/download/0.20/iwyu-0.20-x86_64-linux-gnu.tar.xz",
            ],
        },
        strip_prefix = {
            "linux-aarch64": "iwyu-0.20-aarch64-linux-gnu",
            "linux-x86_64": "iwyu-0.20-x86_64-linux-gnu",
        },
        sha256 = {
            "linux-aarch64": "fb5b9390cca2c8427e02fbbd66046ebcc2f2527bd5781420f8f694c9e2890393",
            "linux-x86_64": "902225023f7348f0b9f4a8b37b668c55091f462c80a10ac6d2fb659c25855277",
        },
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/archive/1.3.0.tar.gz",
        ],
        sha256 = "3b620033ca48fcd6f5ef2ac85e0f6ec5639605fa2f627968490e52fc91a9932f",
        strip_prefix = "bazel-skylib-1.3.0",
    )
