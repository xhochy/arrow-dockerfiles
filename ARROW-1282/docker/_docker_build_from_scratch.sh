#!/bin/bash

set -ex

pushd /io

source /env.sh

# rm -rf arrow/cpp/build
mkdir -p arrow/cpp/build
pushd arrow/cpp/build

cmake -DCMAKE_BUILD_TYPE=$ARROW_BUILD_TYPE \
    -DCMAKE_INSTALL_PREFIX=$ARROW_HOME \
    -DARROW_PYTHON=on \
    -DARROW_JEMALLOC=on \
    -DARROW_BUILD_TESTS=OFF \
    -DCMAKE_CXX_FLAGS='-g -fno-omit-frame-pointer' \
    ..
make -j4
make install
popd

# rm -rf parquet-cpp/build
mkdir -p parquet-cpp/build
pushd parquet-cpp/build

cmake -DCMAKE_BUILD_TYPE=$ARROW_BUILD_TYPE \
      -DCMAKE_INSTALL_PREFIX=$PARQUET_HOME \
      -DPARQUET_BUILD_BENCHMARKS=off \
      -DPARQUET_BUILD_EXECUTABLES=off \
      -DPARQUET_BUILD_TESTS=off \
      ..

make -j4
make install
popd

cd arrow/python
python setup.py build_ext --build-type=$ARROW_BUILD_TYPE \
       --with-parquet --inplace
