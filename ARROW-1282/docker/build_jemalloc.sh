#!/bin/bash

set -ex

source /env.sh

JEMALLOC_VERSION=4.5.0

wget https://github.com/jemalloc/jemalloc/releases/download/${JEMALLOC_VERSION}/jemalloc-${JEMALLOC_VERSION}.tar.bz2
tar xf jemalloc-${JEMALLOC_VERSION}.tar.bz2

pushd jemalloc-${JEMALLOC_VERSION}
./configure --prefix=${CONDA_PREFIX} --disable-tls
make -j4
make install

popd
rm -r jemalloc-${JEMALLOC_VERSION}.tar.bz2 jemalloc-${JEMALLOC_VERSION}
