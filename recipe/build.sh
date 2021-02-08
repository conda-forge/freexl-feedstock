#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

if [ $(uname -m) = 'aarch64' ]; then
  ./configure --prefix=${PREFIX} --host=aarch64-linux-gnu --build=aarch64-linux-gnu
else
  ./configure --prefix=${PREFIX} --host=${HOST} --build=${BUILD}
fi

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check -j${CPU_COUNT}
fi
make install -j${CPU_COUNT}