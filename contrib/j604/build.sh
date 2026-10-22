#!/bin/sh
# SPDX-License-Identifier: MIT
# Reproduce the J604 software-rendering fix. Run in an aarch64 Linux build host.
set -eu
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
build_dir=${1:?Usage: build.sh BUILD_DIRECTORY}
meson setup "$build_dir" "$source_dir" --prefix=/usr --libdir=lib64 --buildtype=release \
  -Dgallium-drivers=asahi,llvmpipe,softpipe -Dvulkan-drivers=asahi \
  -Dllvm=enabled -Dshared-llvm=enabled \
  -Dplatforms=x11,wayland -Dglx=dri -Degl=enabled -Dgbm=enabled \
  -Dvideo-codecs= -Dgallium-rusticl=false -Dbuild-tests=true \
  -Dtools=asahi,drm-shim
ninja -C "$build_dir" -j "${J604_BUILD_JOBS:-6}"
