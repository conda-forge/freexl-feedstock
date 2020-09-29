#!/bin/bash

if [ $(uname -m) = 'aarch64' ]; then
  ./configure --prefix=${PREFIX} --host=aarch64-linux-gnu --build=aarch64-linux-gnu
else
  ./configure --prefix=${PREFIX} --host=${HOST} --build=${BUILD}
fi

make -j${CPU_COUNT}
make check -j${CPU_COUNT}
make install -j${CPU_COUNT}